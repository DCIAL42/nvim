vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust_analyzer"] = {
            diagnostics = {
                enable = true,
                enableExperimental = true,
            },
        },
    },
})
