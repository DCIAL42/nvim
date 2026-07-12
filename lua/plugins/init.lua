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

    {
        "folke/twilight.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    -- {
    --     'hrsh7th/nvim-cmp',
    --     dependencies = {
    --         'hrsh7th/cmp-nvim-lsp',
    --         'hrsh7th/cmp-buffer',
    --         'hrsh7th/cmp-path',
    --         'hrsh7th/cmp-cmdline',
    --         -- Snippet engine (choose one)
    --         -- { 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip' },
    --         -- Or
    --         { 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    --         "rafamadriz/friendly-snippets",
    --     }
    -- },

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

    -- use("lervag/vimtex")

    {
        'vimwiki/vimwiki',
        init = function()
            vim.g.vimwiki_path = '~/wiki'
            vim.g.vimwiki_syntax = 'markdown'
            vim.g.vimwiki_ext = 'md'
            vim.g.vimwiki_global_ext = 0
        end,
    },

{
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    -- {
    --     "github/copilot.vim",
    --     config = function()
    --         vim.cmd("Copilot disable")
    --         vim.g.copilot_no_tab_map = true
    --         vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    --         vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
    --         vim.keymap.set("n", "<leader>ct", function()
    --             if vim.g.copilot_enabled == true then
    --                 vim.g.copilot_enabled = false
    --                 print("Copilot disabled")
    --             else
    --                 vim.g.copilot_enabled = true
    --                 print("Copilot enabled")
    --             end
    --         end
    --         )
    --     end,
    -- },
    -- {
    --     "CopilotC-Nvim/CopilotChat.nvim",
    --     dependencies = {
    --         { "nvim-lua/plenary.nvim", branch = "master" },
    --     },
    --     build = "make tiktoken",
    --     opts = {
    --         -- See Configuration section for options
    --     },
    -- },

    {
        "nvim-treesitter/nvim-treesitter-context",
    },

    -- {
    --     'Maduki-tech/nvim-plantuml',
    --     config = function()
    --         require('plantuml').setup({
    --             output_dir = '.',
    --             viewer = 'open',
    --             auto_refresh = true,
    --         })
    --     end,
    -- },

    {
        'elkowar/yuck.vim',
    },

    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = {
                preset = 'default',
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
            },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
}
