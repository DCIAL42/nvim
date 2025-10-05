vim.g.mapleader = " "
local prefixes = {
    ["python"] = "python3",
    ["sh"] = "bash",
    ["lua"] = "lua",
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "lua", "sh" },
    callback = function()
        vim.keymap.set("n", "<leader>#", function()
            if string.sub(vim.api.nvim_buf_get_lines(0,0,1,true)[1], 1, 2) == "#!" then
                return
            end
            vim.cmd("norm goi#!/usr/bin/env " .. prefixes[vim.bo.filetype] .. "\r\r\x03\x0Fzz")
        end)
    end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
    pattern = { "*" },
    callback = function()
        vim.keymap.set("n", "<leader>#", "<leader>#")
    end,
})
