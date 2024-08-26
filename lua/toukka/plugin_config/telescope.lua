return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>s', builtin.find_files, {})
        vim.keymap.set('n', '<leader>p', builtin.git_files, {})
        vim.keymap.set('n', '<leader>', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end
}
