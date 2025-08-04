vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.guicursor = ""

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "number"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.wrap = false

vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.clipboard:append("unnamedplus")

-- Remaps
vim.g.mapleader = " "
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

