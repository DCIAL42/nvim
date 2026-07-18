return {
    {
        "mbbill/undotree",
        keys = {
            { '<leader>u', vim.cmd.UndotreeToggle },
        },
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

    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        config = function()
            require("luasnip").setup({ enable_autosnippets = true })
            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    {
        "folke/zen-mode.nvim",
        opts = {}
    },

    {
        "folke/twilight.nvim",
        opts = {}
    },

    {
        'windwp/nvim-ts-autotag',
        config = true,
    },

    -- {
    --     'chomosuke/typst-preview.nvim',
    --     ft = 'typst',
    --     version = '1.*',
    --     opts = {},
    -- },

    {
        'stevearc/oil.nvim',
        keys = {
            { "<leader>pv", "<cmd>Oil<CR>", desc = "Oil" },
        },
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },

    -- {
    --     'vimwiki/vimwiki',
    --     init = function()
    --         vim.g.vimwiki_path = '~/wiki'
    --         vim.g.vimwiki_syntax = 'markdown'
    --         vim.g.vimwiki_ext = 'md'
    --         vim.g.vimwiki_global_ext = 0
    --     end,
    -- },

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

    -- {
    --     'elkowar/yuck.vim',
    -- },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
}
