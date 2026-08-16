return {
    {
        'neovim/nvim-lspconfig',
    },

    {
        "mason-org/mason.nvim",
        config = true,
        opts = {
            ui = {
                border = "single",
            },
        },
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            -- Snippet engine (choose one)
            -- { 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip' },
            -- Or
            { 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require 'cmp'

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm(), -- Accept currently selected item.
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    -- Add other sources if needed:
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'neorg' },
                })
            })
        end,
    },

    -- {
    --     'saghen/blink.cmp',
    --     dependencies = { 'saghen/blink.lib', 'rafamadriz/friendly-snippets' },
    --
    --     build = function() require("blink.cmp").build():pwait() end,
    --
    --     ---@module 'blink.cmp'
    --     ---@type blink.cmp.Config
    --     opts = {
    --         keymap = {
    --             preset = 'default',
    --             ['<Tab>'] = { 'select_next', 'fallback' },
    --             ['<S-Tab>'] = { 'select_prev', 'fallback' },
    --             ['<CR>'] = { 'accept', 'fallback' },
    --         },
    --
    --         completion = { documentation = { auto_show = true } },
    --
    --         sources = {
    --             default = { 'lsp', 'path', 'snippets', 'buffer' },
    --         },
    --
    --         fuzzy = { implementation = "prefer_rust_with_warning" },
    --     },
    --     opts_extend = { "sources.default" }
    -- },

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
            require("luasnip").setup({ enable_autosnippets = true })
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
            require("luasnip.loaders.from_vscode").lazy_load()
            local filetype_extend = require("luasnip").filetype_extend
            filetype_extend("typescriptreact", { "html" })
            filetype_extend("javascriptreact", { "html" })
        end,
    },

    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
}
