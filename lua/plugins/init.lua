return {
    {
        "mbbill/undotree",
        keys = {
            { '<leader>u', vim.cmd.UndotreeToggle },
        },
    },

    {
        "folke/zen-mode.nvim",
        keys = {
            {
                "<leader>zz", "<cmd>ZenMode<CR>", noremap = true, silent = true,
            },
        },
        dependencies = { "folke/twilight.nvim", opts = {} },
        opts = { plugins = { twilight = { enabled = true } } }
    },

    {
        'windwp/nvim-ts-autotag',
        config = true,
    },

    {
        'stevearc/oil.nvim',
        keys = {
            {
                "<leader>pv",
                function()
                    local oil = require("oil")
                    oil.open_float()
                end,
                desc = "Oil"
            },
        },
        opts = {
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
            float = {
                max_width = 0.6,
                border = "single",
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
        lazy = false,
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    -- {
    --     'stevearc/dressing.nvim',
    --     opts = {},
    -- },

    -- {
    --     'chomosuke/typst-preview.nvim',
    --     ft = 'typst',
    --     version = '1.*',
    --     opts = {},
    -- },

    -- {
    --     'vimwiki/vimwiki',
    --     init = function()
    --         vim.g.vimwiki_path = '~/wiki'
    --         vim.g.vimwiki_syntax = 'markdown'
    --         vim.g.vimwiki_ext = 'md'
    --         vim.g.vimwiki_global_ext = 0
    --     end,
    -- },

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
}
