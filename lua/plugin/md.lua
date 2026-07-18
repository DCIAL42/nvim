local gh = require "plugin.helpers".gh

vim.pack.add({ gh 'MeanderingProgrammer/render-markdown.nvim' })
require "render-markdown".setup {}

vim.pack.add({ gh "tadmccorkle/markdown.nvim" })
require "markdown".setup()
