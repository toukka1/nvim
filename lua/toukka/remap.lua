vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- preserve pasted text
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("i", "<C-c>", "<Esc>")

-- umlauts to braces and brackets
vim.keymap.set("i", "ö", "[")
vim.keymap.set("i", "ä", "]")
vim.keymap.set("i", "Ö", "{")
vim.keymap.set("i", "Ä", "}")
