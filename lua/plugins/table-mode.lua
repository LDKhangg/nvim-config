return {
  "dhruvasagar/vim-table-mode",
  ft = { "markdown", "vimwiki" },
  config = function()
    vim.g.table_mode_corner = "|"
    vim.g.table_mode_syntax = 1
    -- Tự động bật Table Mode khi mở file markdown
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "vimwiki" },
      callback = function()
        vim.cmd("TableModeEnable")
      end,
    })
  end,
}
