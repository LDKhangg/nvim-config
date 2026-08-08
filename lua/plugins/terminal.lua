return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 12,
      direction = "horizontal",
      start_in_insert = true,
      close_on_exit = true,
      auto_scroll = true,
      env = { IN_TOGGLETERM = "1" }, -- chặn fastfetch trong toggle terminal (guard ở ~/.zshrc)
      float_opts = {
        border = "curved",
      },
      winbar = {
        enabled = true,
        name_formatter = function(_)
          return "      TERMINAL      "
        end,
      },
    })
    -- Thanh winbar màu accent sáng -> đường phân cách rõ với vùng code/tab phía trên.
    -- Lưu ý: WinSeparator của cửa sổ terminal không hiện được do đường kẻ ngang
    -- giữa 2 cửa sổ xếp dọc do cửa sổ PHÍA TRÊN vẽ; winbar do chính terminal vẽ
    -- nên chắc chắn hiện. Định nghĩa highlight SAU setup vì toggleterm ghi đè
    -- WinBarActive/WinBarInactive trong lúc setup.
    vim.api.nvim_set_hl(0, "WinBarActive", { bg = "#b4befe", fg = "#1e2030", bold = true })
    vim.api.nvim_set_hl(0, "WinBarInactive", { bg = "#6c7086", fg = "#1e2030" })
  end,
}
