vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Move text blocks in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center cursor when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Preserve pasted text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Put cut out characters in another register
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("i", "<C-c>", "<Esc>")
