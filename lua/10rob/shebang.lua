local fileName = vim.fn.expand('%')
local file = io.open(fileName, "r+")
if file ~= nil then
    local prefixes = {
        [".py"] = "python3",
        [".sh"] = "bash",
    }
    local prefix = prefixes[fileName:sub(string.find(fileName, ".", 1, true), -1)]
    if prefix ~= nil and file:read("*a") == "" then
        file:write("#!/usr/bin/env ", prefix)
    end
    file:close()
end
