vim.lsp.config("r_language_server", {
    settings = {
        r = {
            format = { indent_size = 4, indent_style = "space" }
        }
    }
})

vim.cmd([[
    se makeprg=Rscript\ %
]])
