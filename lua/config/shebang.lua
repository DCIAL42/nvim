vim.g.mapleader = " "
local prefixes = {
    ["python"] = "python3",
    ["sh"] = "bash",
    ["lua"] = "lua",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.py", "*.lua", "*.sh" },
    callback = function()
        vim.keymap.set("n", "<leader>#", function()
            local shebang_line = "#!/usr/bin/env " .. prefixes[vim.bo.filetype]
            local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, true)[1]
            if first_line ~= shebang_line then
                if string.sub(first_line, 1, 2) == "#!" then
                    vim.cmd("norm mbgocc#!/usr/bin/env " .. prefixes[vim.bo.filetype] .. "")
                else
                    vim.cmd("norm mbgoi#!/usr/bin/env " .. prefixes[vim.bo.filetype] .. "\r\r")
                end
            end
        end)
    end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
    pattern = { "*" },
    callback = function()
        vim.keymap.set("n", "<leader>#", "<leader>#")
    end,
})

for k, v in ipairs(vim.api.nvim_buf_get_keymap(0, "n")) do
    print(k)
    for x, y in ipairs(v) do
        print(x, y)
    end
end
