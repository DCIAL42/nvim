return {
    {
        "mbbill/undotree",
        keys = {
            { '<leader>u', vim.cmd.UndotreeToggle },
        }
    },

    {
        'neovim/nvim-lspconfig',
    },

    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
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
        config = function()
            require("trouble").setup({})
        end,
    },

    { "rafamadriz/friendly-snippets" },

    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        config = function()
            require("luasnip").setup({ enable_autosnippets = true })
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
        end,
    },

    {
        "folke/zen-mode.nvim",
        opts = {}
    },

    --[[
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = "vague"
            }
        }
    },
    ]] --

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
        }
    },

    {
        'windwp/nvim-ts-autotag',
    },

    {
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '1.*',
        opts = {},    -- lazy.nvim will implicitly calls `setup {}`
    },

    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },

    --use("lervag/vimtex")
    --use {
    --    "windwp/nvim-autopairs",
    --    event = "InsertEnter",
    --    config = function()
    --        require("nvim-autopairs").setup {}
    --    end
    --}
    --[[
    {
        "github/copilot.vim",
        config = function()
            vim.cmd("Copilot disable")
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
            vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
            vim.keymap.set("n", "<leader>ct", function()
                if vim.g.copilot_enabled == true then
                    vim.g.copilot_enabled = false
                    print("Copilot disabled")
                else
                    vim.g.copilot_enabled = true
                    print("Copilot enabled")
                end
            end
            )
        end,
    },
    --]]
    --use("laytan/cloak.nvim")
    --use('tpope/vim-fugitive')
}
