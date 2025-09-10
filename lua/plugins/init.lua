return {
    --{ "rose-pine/neovim", name = "rose-pine" },

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

    'neovim/nvim-lspconfig',

    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
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
                theme = "tokyonight"
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
