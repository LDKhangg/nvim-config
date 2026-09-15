return {
  "romgrk/barbar.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = false,
    auto_hide = false,
    tabpages = false,
    clickable = true,
    maximum_length = 12,
    minimum_length = 0,
    maximum_padding = 1,
    minimum_padding = 0,
    hide = { extensions = true, inactive = false },
    icons = {
      separator = { left = "▎", right = "" },
      separator_at_end = false,
      filetype = { enabled = true, custom_colors = false },
      button = "×",
      modified = { button = "●" },
      pinned = { button = "", filename = true },
    },
    sidebar_filetypes = {
      ["neo-tree"] = { event = "BufWipeout", text = "neo-tree", align = "left" },
      undotree = { text = "undotree", align = "center" },
    },
    letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
  },
}
