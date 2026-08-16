local function setup_norg_parsers()
    local lazy_rocks = vim.fn.stdpath("data") .. "/lazy-rocks"
    local site_parser = vim.fn.stdpath("data") .. "/site/parser"
    vim.fn.mkdir(site_parser, "p")
    local parsers = {
        { "tree-sitter-norg",      "norg" },
        { "tree-sitter-norg-meta", "norg_meta" },
    }
    for _, pkg in ipairs(parsers) do
        local src = lazy_rocks .. "/" .. pkg[1] .. "/lib/lua/5.1/parser/" .. pkg[2] .. ".so"
        local dst = site_parser .. "/" .. pkg[2] .. ".so"
        if vim.uv.fs_stat(src) and not vim.uv.fs_stat(dst) then
            vim.fn.system({ "ln", "-s", src, dst })
        end
    end
    for _, pkg in ipairs(parsers) do
        pcall(vim.treesitter.language.register, pkg[2], ".norg")
    end
end

return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            -- 'nvim-mini/mini.icons',
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },

    {
        "tadmccorkle/markdown.nvim",
        ft = "markdown",
        opts = {},
    },

    {
        "nvim-neorg/neorg",
        lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        keys = {
            {
                "<leader>nw",
                "<cmd>Neorg workspace<CR>",
                silent = true,
            },
            {
                "<leader>nr",
                "<cmd>Neorg return<CR>",
                silent = true,
            },
            {
                "<leader>ni",
                "<cmd>Neorg index<CR>",
                silent = true,
            },
        },
        config = function()
            setup_norg_parsers()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.summary"] = {},
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                        },
                    },
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes"
                            },
                            default_workspace = "notes",
                        },
                    },
                    ["core.esupports.metagen"] = {
                        config = {
                            author = "daniel",
                            type = "auto",
                        },
                    },
                },
            })
        end,
    }
}
