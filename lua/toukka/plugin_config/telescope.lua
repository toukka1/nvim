return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-s>', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
        -- Live grep selected text
        vim.keymap.set('v', '<C-f>', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', {})
    end
}
