return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup()

        local parsers = { "lua", "c", "cpp", "html", "css", "javascript", "typescript", "markdown", "python", "rust",
            "go", "odin", "json", "java", "svelte" }
        treesitter.install(parsers)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = parsers,

            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
