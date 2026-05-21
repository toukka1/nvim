-- CONFIG
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.winborder = "rounded"
vim.opt.pumheight = 15

vim.opt.path:append("**")
vim.opt.wildignore:append {"*.venv/*", "*/.git/*", "*/target/*", "*/__pycache__/*"}

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.clipboard:append("unnamedplus")

-- REMAPS
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Move text blocks in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center cursor when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Navigate quickfix list
vim.keymap.set("n", "<C-k>", ":cp<CR>")
vim.keymap.set("n", "<C-j>", ":cn<CR>")

-- Preserve pasted text
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Put cut out characters in another register
vim.keymap.set("n", "x", '"_x')

-- PLUGINS
vim.pack.add({
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/tpope/vim-dispatch" },
})

vim.opt.completeopt = "menu,menuone,noselect"

require("catppuccin").setup({ transparent_background = true })
vim.cmd("colorscheme catppuccin-latte")

vim.opt.grepprg = "rg --vimgrep --smart-case"
vim.api.nvim_create_user_command("G", function(opts)
  vim.cmd("silent grep " .. vim.fn.shellescape(opts.args))
  vim.cmd("cw")
end, {
  nargs = "+",
})

local makeprg_by_ft = {
  rust = "cargo build",
  c = "make -j32",
  cpp = "make -j32",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(makeprg_by_ft),
  callback = function(args)
    vim.opt_local.makeprg = makeprg_by_ft[args.match]
  end,
})
