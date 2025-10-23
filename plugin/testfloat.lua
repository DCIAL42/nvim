local show_git_blame = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    local ns = vim.api.nvim_create_namespace("my-plugin")
    local m1 = vim.api.nvim_buf_set_extmark(0, ns, 0, 0,
        { virt_lines = { { { "test", "Comment" } } }, virt_lines_above = true })
end

local parse_blames = function(data)
    local author = "^author "
    local commits = {}
    local current_commit = {}
    for k, v in ipairs(data) do
        table.insert(current_commit, v)
        if (k + 2) < #data and string.find(data[k + 2], author) then
            table.insert(commits, current_commit)
            current_commit = {}
        end
    end
    table.insert(commits, current_commit)
    vim.print(commits)
end

local file = vim.fn.expand("%")
local job = vim.fn.jobstart(
    { "git", "blame", file, "-p" },
    {
        on_stdout = function(_, data)
            parse_blames(data)
        end,
    }
)

local clear_virtual_text = function()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
end

vim.api.nvim_buf_create_user_command(0, "ClearVirtualText", clear_virtual_text, {})
vim.api.nvim_buf_create_user_command(0, "ShowGitBlame", show_git_blame, {})
