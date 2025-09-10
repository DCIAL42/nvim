vim.g.mapleader = " "
local prefixes = {
    ["python"] = "python3",
    ["sh"] = "bash",
    ["lua"] = "lua",
}

if prefixes[vim.bo.filetype] == nil then
    return
end
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "lua", "sh" },
    callback = function()
        vim.keymap.set("n", "<leader>#", "i#!/usr/bin/env " .. prefixes[vim.bo.filetype] .. "<CR><C-c>")
    end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
    pattern = { "*" },
    callback = function()
        vim.keymap.set("n", "<leader>#", "<leader>#")
    end,
})
--vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--  pattern = {"*.py"},
--  callback = function()
--	  filetype()
--  end,
--})
--if prefix ~= nil then
--    local thing = "i#!/usr/bin/env " .. prefix .. "<CR><C-c>d$"
--    vim.keymap.set("n", "<leader>#", thing)
--end
-- local fileName = vim.fn.expand('%')
-- local file = io.open(fileName, "r+")
-- if file ~= nil then
--     local prefixes = {
--         [".py"] = "python3",
--         [".sh"] = "bash",
--         [".lua"] = "lua",
--     }
--     local prefix = prefixes[fileName:sub(string.find(fileName, ".", 1, true), -1)]
--     if prefix ~= nil and file:read("*a") == "" then
--         file:write("#!/usr/bin/env ", prefix)
--     end
--     file:close()
-- end
