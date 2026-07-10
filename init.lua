require('config')
-- require("plugin.testfloat").setup {}


local function dashboard()
    if #vim.fn.argv() > 0 then return end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(0, buf)

    local lines = {
        "",
        "test",
        "",
    }

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    local win_height = vim.api.nvim_win_get_height(0)
    local top_padding = math.floor((win_height - #lines) / 2) - 1
    if top_padding > 0 then
        local padding_lines = vim.tbl_map(function() return "" end, vim.fn.range(top_padding))
        vim.api.nvim_buf_set_lines(buf, 0, 0, false, padding_lines)
    end

    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].bufhidden = 'wipe'
    vim.bo[buf].buflisted = false
    vim.bo[buf].swapfile = false
    vim.bo[buf].modifiable = false

    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.signcolumn = 'no'
    vim.wo.statusline = ''
end

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        if vim.fn.argc() == 0 and vim.api.nvim_win_get_buf(0) == vim.api.nvim_get_current_buf() then
            dashboard()
        end
    end,
})
