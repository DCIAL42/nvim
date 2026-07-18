require "plugin.dev"
require "plugin.harpoon"
require "plugin.helpers"
require "plugin.md"
require "plugin.telescope"
require "plugin.themes"
require "plugin.treesitter"
local helpers = require "plugin.helpers"

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name = ev.data.spec.name
        local kind = ev.data.kind
        if kind ~= 'install' and kind ~= 'update' then return end

        if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
            helpers.run_build(name, { 'make' }, ev.data.path)
            return
        end

        if name == 'LuaSnip' then
            if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then
                helpers.run_build(name,
                    { 'make', 'install_jsregexp' }, ev.data.path)
            end
            return
        end

        if name == 'nvim-treesitter' then
            if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
            vim.cmd 'TSUpdate'
            return
        end
    end,
})

local gh = helpers.gh

vim.pack.add({ gh "mbbill/undotree" })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.pack.add({ gh "mason-org/mason.nvim" })
require "mason".setup()

vim.pack.add({ gh "neovim/nvim-lspconfig" })

vim.pack.add({ gh "mason-org/mason-lspconfig.nvim" })
require "mason-lspconfig".setup()

vim.pack.add({ gh "folke/trouble.nvim" })
require "trouble".setup()
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP Definitions / references / ... (Trouble)" })
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

vim.pack.add({ gh "rafamadriz/friendly-snippets" })
vim.pack.add({ { src = gh "L3MON4D3/LuaSnip", version = vim.version.range("2.*") } })

require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
require("luasnip.loaders.from_vscode").lazy_load()

vim.pack.add({ gh "folke/zen-mode.nvim" })

vim.pack.add({ gh "folke/twilight.nvim" })

vim.pack.add({
    gh 'stevearc/oil.nvim',
    { src = gh "nvim-tree/nvim-web-devicons" },
})
require "oil".setup()

vim.pack.add({ gh "windwp/nvim-autopairs" })
require "nvim-autopairs".setup {}

vim.pack.add({
    gh 'saghen/blink.lib',
    gh 'saghen/blink.cmp',
})
local cmp = require "blink.cmp"
cmp.build():pwait()
cmp.setup(
    {
        keymap = {
            preset = 'default',
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
        },

        -- (Default) Only show the documentation popup when manually triggered
        -- completion = { documentation = { auto_show = false } },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        -- sources = {
        --     default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        -- fuzzy = { implementation = "prefer_rust_with_warning" }
    }
)

vim.pack.add({ gh 'windwp/nvim-ts-autotag' })
require "nvim-ts-autotag".setup()

vim.pack.add({
    gh "folke/todo-comments.nvim",
    { src = "nvim-lua/plenary.nvim" },
})
require "todo-comments".setup()

-- 'chomosuke/typst-preview.nvim'

-- "lervag/vimtex"

-- 'vimwiki/vimwiki'
-- init = function()
--     vim.g.vimwiki_path = '~/wiki'
--     vim.g.vimwiki_syntax = 'markdown'
--     vim.g.vimwiki_ext = 'md'
--     vim.g.vimwiki_global_ext = 0
-- end,

-- "zbirenbaum/copilot.lua"
-- require("copilot").setup({
--     suggestion = {
--         auto_trigger = true,
--         keymap = {
--             accept = "<C-enter>",
--             accept_word = "<C-l>",
--             accept_line = "<C-j>",
--             next = "<M-]>",
--             prev = "<M-[>",
--             dismiss = "<C-]>",
--         },
--     },
--     filetypes = {
--         markdown = true,
--         help = true,
--     },
-- })
-- vim.keymap.set("n", "<leader>ct", "<cmd>Copilot suggestion toggle_auto_trigger<CR>",
--     { desc = "Toggle copilot suggestions" })

-- 'Maduki-tech/nvim-plantuml',
-- require('plantuml').setup({
--     output_dir = '.',
--     viewer = 'open',
--     auto_refresh = true,
-- })

-- 'elkowar/yuck.vim'
