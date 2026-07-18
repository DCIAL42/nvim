return {
    {
        'neovim/nvim-lspconfig',
    },

    {
        "mason-org/mason.nvim",
        config = true,
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
    },

    {
        'saghen/blink.cmp',
        dependencies = { 'saghen/blink.lib', 'rafamadriz/friendly-snippets' },

        build = function() require("blink.cmp").build():pwait() end,

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'default',
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
            },

            completion = { documentation = { auto_show = true } },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" }
    },
}
