local M = {}

local state = {
    namespace = {
        id = 0,
        extmarks = {},
    },
}

--- Takes output from git blame for the current file and parses them
---@param data string[]
---@return table
local parse_blames = function(data)
    local author = "^author "
    local time = "^committer"
    local commits = {}
    local current_commit = {}
    for k, v in ipairs(data) do
        if (k + 1) < #data and data[k + 1]:find(author) then
            current_commit.commit = v
        else
            local space_loc = v:find(" ") or 1
            local key = v:sub(1, space_loc - 1)
            current_commit[key] = v:sub(space_loc + 1)
        end

        if (k + 2) < #data and data[k + 2]:find(author) then
            table.insert(commits, current_commit)
            current_commit = {}
        end
    end
    table.insert(commits, current_commit)
    return commits
end

M.load_blames = function()
    local file = vim.fn.expand("%")
    if file == "" then return end

    local stdout_chunks = {}

    local job = vim.fn.jobstart(
        { "git", "blame", file, "--line-porcelain" },
        {
            on_stdout = function(_, data)
                if data then
                    for _, line in ipairs(data) do
                        table.insert(stdout_chunks, line)
                    end
                end
            end,

            on_exit = function(_, exit_code)
                if exit_code == 0 then
                    M.show_git_blame(parse_blames(stdout_chunks))
                end
            end,
        }
    )
end

local parse_time = function(time)
    if not time then return end
    local time_table = os.date("*t", os.time() - time)
    return time
end

local parse_line = function(line)
    local commit = line.commit

    local start = (string.find(commit, " ") or 0) + 1
    local mid = (string.find(commit, " ", start) or 0) + 1
    local endpos = string.find(commit, " ", mid) or 1
    local author = line.author
    local message = line.summary
    local row = tonumber(string.sub(commit, mid, endpos))
    local time = tonumber(line["committer-time"])
    local parsed_time = parse_time(time)

    local hash = string.sub(commit, 0, start - 2)
    if hash == "0000000000000000000000000000000000000000" then
        author = "You"
        message = "Uncommitted changes"
    end

    if author and parsed_time and message then
        return "\t\t" .. author .. ", " .. parsed_time .. " • " .. message
    end
end

M.show_git_blame = function(data)
    if not data then return end

    local show_all = data.show_all or false
    local prev = ""
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]

    if not show_all then
        local line = data[curr_line]
        local blame_text = parse_line(line)

        if blame_text then
            vim.api.nvim_buf_set_extmark(0, state.namespace.id, curr_line - 1, 0, {
                virt_text = { { blame_text, "Comment" } },
                virt_text_pos = "eol",
            })
        end
    end

    for k, line in ipairs(data) do
        local commit = line.commit

        local start = string.find(commit, " ") or 1

        local hash = string.sub(commit, 0, start - 2)

        local blame_text

        if hash == "0000000000000000000000000000000000000000" then
            blame_text = "Uncommitted"
            vim.fn.sign_place(0, 'uncommitted_sign_group', 'UncommittedSign', vim.api.nvim_buf_get_name(0), { lnum = k })
        end

        if show_all and row ~= nil and hash ~= prev then
            local mid = string.find(commit, " ", start) + 1
            local endpos = string.find(commit, " ", mid)
            local author = line.author
            local message = line.summary
            local row = tonumber(string.sub(commit, mid, endpos))
            local time = tonumber(line["committer-time"])

            local parsed_time = parse_time(time)
            if author and parsed_time and message then
                blame_text = author .. ", " .. parsed_time .. " • " .. message

                vim.api.nvim_buf_set_extmark(0, state.namespace.id, row - 1, 0, {
                    virt_text = { { blame_text, "Comment" } },
                    virt_text_pos = "eol",
                })
            end
            -- state.namespace.extmarks:insert(m)
        end

        prev = hash
    end
end

M.clear_virtual_text = function()
    vim.api.nvim_buf_clear_namespace(0, state.namespace.id, 0, -1)
    vim.fn.sign_unplace('my_sign_group')
end

M.setup = function(opts)
    vim.api.nvim_buf_create_user_command(0, "ClearVirtualText", M.clear_virtual_text, {})
    vim.api.nvim_buf_create_user_command(0, "ShowGitBlame", M.show_git_blame, {})
    state.namespace.id = vim.api.nvim_create_namespace("blame-test")
    vim.fn.sign_define('UncommittedSign', { text = 'C', texthl = 'WarningMsg' })
    vim.api.nvim_create_autocmd({ "CursorMoved" }, {
        callback = function()
            M.clear_virtual_text()
            M.load_blames()
        end,
    })
end

return M
