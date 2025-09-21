vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('luals')
vim.lsp.enable('ts_ls')

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
        -- { name = 'luasnip' },
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
