local M = {}

local state = {
    namespace = {
        id = 0,
        extmarks = {},
    },
    files = {},
}

--- Takes output from git blame --line-porcelain
--- for the current file and parses them
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
    vim.print(file)
    if file == "" then return end

    local stdout_chunks = {}

    local job = vim.fn.jobstart(
        { "git", "blame", file, "--line-porcelain" },
        {
            on_stdout = function(_, data, _)
                if data then
                    for _, line in ipairs(data) do
                        table.insert(stdout_chunks, line)
                    end
                end
            end,

            on_exit = function(_, exit_code, _)
                if exit_code == 0 then
                    local stuff = parse_blames(stdout_chunks)
                    state.files[file] = stuff
                    M.show_git_blame()
                end
            end,
        }
    )
end

M.show_git_blame = function()
    local file_data = state.files[vim.fn.expand("%")]

    vim.print(file_data)
    if not file_data then return end

    local prev = ""
    for k, line in ipairs(file_data) do
        local commit = line.commit

        local start = string.find(commit, " ") + 1
        local mid = string.find(commit, " ", start) + 1
        local endpos = string.find(commit, " ", mid)

        local author = line.author
        local message = line.summary
        local hash = string.sub(commit, 0, start - 2)
        local row = tonumber(string.sub(commit, mid, endpos))

        local blame_text = author .. " • " .. message
        local time = tonumber(line["committer-time"])
        print(os.date("%M", os.time() - time))

        if hash == "0000000000000000000000000000000000000000" then
            blame_text = "Uncommitted"
            vim.fn.sign_place(0, 'my_sign_group', 'UncommittedSign', vim.api.nvim_buf_get_name(0), { lnum = k })
        end

        if row ~= nil and hash ~= prev then
            vim.api.nvim_buf_set_extmark(0, state.namespace.id, row - 1, 0, {
                virt_text = { { blame_text, "Comment" } },
                virt_text_pos = "eol",
            })
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
