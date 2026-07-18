return {
    {
        "rose-pine/neovim",
        name = "rose-pine"
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = { style = "night", transparent = "true" },
    },

    {
        "vague2k/vague.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other plugins
    },

    { "rebelot/kanagawa.nvim" },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    { "EdenEast/nightfox.nvim" },
    { "sainnhe/gruvbox-material" },
    { "morhetz/gruvbox" },
    { "tiagovla/tokyodark.nvim" },
}
