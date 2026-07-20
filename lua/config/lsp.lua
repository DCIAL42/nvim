-- local lsps = {}
--
-- for file in vim.fs.dir(vim.fn.stdpath("config") .. "/lsp/") do
--     table.insert(lsps, vim.fn.fnamemodify(file, ':t:r'))
-- end
--
-- vim.lsp.enable(lsps)

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },

    jump = {
        on_jump = function(_, bufnr)
            vim.diagnostic.open_float({
                bufnr = bufnr,
                scope = 'cursor',
                focus = false,
            })
        end,
    },
})
