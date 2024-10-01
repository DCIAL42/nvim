local fileName = vim.fn.expand('%')
local file = io.open(fileName, "r+")
if file ~= nil then
    if string.find(fileName, ".py") and file:read("*a") == "" then
        file:write("#!/usr/bin/env python3")
    end
    file:close()
end
