vim.pack.add({ "https://github.com/catppuccin/nvim" })

require("catppuccin").setup({
    flavour = "latte", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    no_italic = true, -- Force no italic
})

vim.cmd[[colorscheme catppuccin]]

