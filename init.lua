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
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.winborder = "rounded"
vim.opt.pumheight = 15

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

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

-- Preserve pasted text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Put cut out characters in another register
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("i", "<C-c>", "<Esc>")

-- PLUGINS
vim.pack.add({
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup()
vim.lsp.enable({ "lua_ls", "clangd", "robotcode", "pylsp", "rust_analyzer" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})

require("catppuccin").setup({ transparent_background = true })
vim.cmd("colorscheme catppuccin-latte")

require('telescope').setup({})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-s>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('v', '<C-f>', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', {})

require("nvim-treesitter.configs").setup({
    ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "bash", "python", "robot" },
    highlight = { enable = true }
})
