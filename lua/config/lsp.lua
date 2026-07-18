-- vim.lsp.enable({
--     'ruff', 'pylsp', 'clangd',
--     'lua_ls', 'bashls', 'rust_analyzer',
--     'tinymist', 'r_language_server', 'ts_ls',
--     'ocamllsp', 'hls', 'jdtls',
--     'gopls'
-- })
--     'eslint', 'tailwindcss',
--     'biome', 'ocamllsp', 'hls', 'jdtls',
--     'ols'
-- })

-- local lsps = {}
--
-- for file in vim.fs.dir(vim.fn.stdpath("config") .. "/lsp/") do
--     table.insert(lsps, vim.fn.fnamemodify(file, ':t:r'))
-- end
--
-- vim.lsp.enable(lsps)
--
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         if client and client:supports_method("textDocument/formatting") then
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 buffer = args.buf,
--                 callback = function()
--                     vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
--                 end,
--             })
--         end
--     end,
-- })


-- local filetype_extend = require("luasnip").filetype_extend
-- filetype_extend("typescriptreact", { "html" })
-- filetype_extend("javascriptreact", { "html" })

-- local cmp = require 'cmp'
--
-- cmp.setup({
--     snippet = {
--         expand = function(args)
--             require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--         end,
--     },
--     mapping = cmp.mapping.preset.insert({
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<CR>'] = cmp.mapping.confirm(), -- Accept currently selected item.
--         ['<Tab>'] = cmp.mapping.select_next_item(),
--         ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--     }),
--     sources = cmp.config.sources({
--         { name = 'nvim_lsp' },
--         -- Add other sources if needed:
--         { name = 'luasnip' },
--         -- { name = 'buffer' },
--         -- { name = 'path' },
--     })
-- })

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },

    jump = {
        on_jump = function(_, bufnr)
            vim.diagnostic.open_float({
                bufnr = bufnr,
                scope = 'cursor',
                focus = false,
            })
        end,
    },
})

-- require('nvim-ts-autotag').setup({
--     opts = {
--         enable_close = true,
--         enable_rename = true,
--         enable_close_on_slash = true,
--     },
-- })
