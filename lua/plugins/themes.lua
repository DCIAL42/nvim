return {
    { "rose-pine/neovim", name = "rose-pine" },

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
        "vague2k/vague.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other plugins
    },

    {
        "RedsXDD/neopywal.nvim",
        name = "neopywal",
        lazy = false,
        priority = 1000,
        opts = {
            transparent_background = true,
            notify = "error",
        },
    },

    {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
            require("themery").setup({
                themes = { "tokyonight", "rose-pine", "vague", "neopywal" },
                livePreview = true, -- Apply theme while picking. Default to true.
                themeConfigFile = "c:\\v:null",
            })
        end
    },
}
