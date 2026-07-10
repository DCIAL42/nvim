local map = vim.keymap.set

-- map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>pv", ":Oil<CR>")

map("n", "<leader>r", ":w<CR>:make<CR>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", [["_dP]])

map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<leader>lf", vim.lsp.buf.format)

map("n", "<C-j>", "<cmd>cnext<CR>zz")
map("n", "<C-k>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map("n", "<leader><leader>", function()
    vim.cmd("so")
end)

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

map("i", "{", "{}<C-c>i")
map("i", "(", "()<C-c>i")
map("i", "[", "[]<C-c>i")


map("n", "<leader>e", ":w<CR>:!einstein %<CR>")
map("n", "<Tab>", "<C-n>", { noremap = true, silent = true })
map("n", "<S-Tab>", "<C-p>", { noremap = true, silent = true })

map("t", "<esc><esc>", "<C-\\><C-n>")

map("n", "<leader>zz", "<cmd>Twilight<CR><cmd>ZenMode<CR>", { noremap = true, silent = true })

-- map({ "n", "v" }, "j", "jzz")
-- map({ "n", "v" }, "k", "kzz")
