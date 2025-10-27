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
    local commits = {}
    local current_commit = {}
    for k, v in ipairs(data) do
        if (k + 1) < #data and data[k + 1]:find(author) then
            current_commit["commit"] = v
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
    local time_table = os.date("*t", os.time() - time)
    vim.print(time_table)
end

M.show_git_blame = function(data)
    if not data then return end

    local prev = ""
    for k, line in ipairs(data) do
        local commit = line.commit

        local start = string.find(commit, " ") + 1
        local mid = string.find(commit, " ", start) + 1
        local endpos = string.find(commit, " ", mid)

        local author = line.author
        local message = line.summary
        local hash = string.sub(commit, 0, start - 2)
        local row = tonumber(string.sub(commit, mid, endpos))

        local blame_text = author .. " • " .. message

        if hash == "0000000000000000000000000000000000000000" then
            blame_text = "Uncommitted"
            vim.fn.sign_place(0, 'uncommitted_sign_group', 'UncommittedSign', vim.api.nvim_buf_get_name(0), { lnum = k })
        end

        if row ~= nil and hash ~= prev then
            local time = tonumber(line["committer-time"])

            parse_time(time)

            vim.api.nvim_buf_set_extmark(0, state.namespace.id, row - 1, 0, {
                virt_text = { { blame_text, "Comment" } },
                virt_text_pos = "eol",
            })
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
    vim.api.nvim_create_autocmd({ "BufWritePre", "BufEnter" }, {
        callback = function()
            M.clear_virtual_text()
            M.load_blames()
        end,
    })
end

return M
