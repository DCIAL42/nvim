local gh = require "plugin.helpers".gh

vim.pack.add({ { src = gh "rose-pine/neovim", name = "rose-pine" } })
vim.pack.add({ gh "folke/tokyonight.nvim" })
require "tokyonight".setup()
vim.pack.add({ gh "vague2k/vague.nvim" })
vim.pack.add({ gh "rebelot/kanagawa.nvim" })
vim.pack.add({ gh "catppuccin/nvim" })
vim.pack.add({ gh "EdenEast/nightfox.nvim" })
vim.pack.add({ gh "sainnhe/gruvbox-material" })
vim.pack.add({ gh "morhetz/gruvbox" })
vim.pack.add({ gh "tiagovla/tokyodark.nvim" })

-- vim.pack.add({
--     gh "DCIAL42/theme.nvim",
--     {
--         src = 'nvim-telescope/telescope.nvim',
--     },
--     {
--         src = 'nvim-lua/plenary.nvim',
--     },
-- })
-- require "theme".setup()
