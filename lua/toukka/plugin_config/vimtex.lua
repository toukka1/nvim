return {
  "lervag/vimtex",
  lazy = false,
  -- tag = "v2.15"
    config = function()
        vim.g.vimtex_view_general_viewer = 'SumatraPDF.exe'
        vim.g.vimtex_view_general_options = '-reuse-instance thesis.pdf'
        vim.g.vimtex_quickfix_open_on_warning = 0
  end
}
