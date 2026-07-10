-- vim.lsp.enable({
--     'ruff', 'pylsp', 'clangd',
--     'lua_ls', 'bashls', 'rust_analyzer',
--     'tinymist', 'r_language_server', 'ts_ls',
--     'ocamllsp', 'hls', 'jdtls',
--     'gopls'
-- })

local lsp_configs = {}

for _, f in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
    local server_name = vim.fn.fnamemodify(f, ':t:r')
    table.insert(lsp_configs, server_name)
end

vim.lsp.enable(lsp_configs)

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
            pattern = { "*" },
            callback = function()
                vim.lsp.buf.format()
            end,
        })
    end,
})

require("luasnip.loaders.from_vscode").lazy_load()

local filetype_extend = require("luasnip").filetype_extend
filetype_extend("typescriptreact", { "html" })
filetype_extend("javascriptreact", { "html" })

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm(), -- Accept currently selected item.
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- Add other sources if needed:
        { name = 'luasnip' },
        -- { name = 'buffer' },
        -- { name = 'path' },
    })
})

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '●', '▎', '■', or ''
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

require('nvim-ts-autotag').setup({
    opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
    },
})
