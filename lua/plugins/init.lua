return {
    --{ "rose-pine/neovim", name = "rose-pine" },

    --[[
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = "true",
            })

            vim.cmd.colorscheme "tokyonight"
        end,
    },
    ]] --
    {
        "vague2k/vague.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other plugins
        config = function()
            -- NOTE: you do not need to call setup if you don't want to.
            require("vague").setup({
                transparent = true
            })
            vim.cmd("colorscheme vague")
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate"
    },

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
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = "vague"
            }
        }
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            -- Snippet engine (choose one)
            { 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip' },
            -- Or
            -- {'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip'},
        }
    },

    {
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '1.*',
        opts = {}, -- lazy.nvim will implicitly calls `setup {}`
    },

    --use("eandrju/cellular-automaton.nvim")
    --use("lervag/vimtex")
    --use {
    --    "windwp/nvim-autopairs",
    --    event = "InsertEnter",
    --    config = function()
    --        require("nvim-autopairs").setup {}
    --    end
    --}
    --use("github/copilot.vim")
    --use("laytan/cloak.nvim")
    --use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    --use('nvim-treesitter/playground')
    --use('tpope/vim-fugitive')
    --use('CRAG666/code_runner.nvim')

    --use({ 'hrsh7th/nvim-cmp' })
    --use({ 'hrsh7th/cmp-nvim-lsp' })
}
