return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Todo comments" },
  },
  opts = {
    signs = true,
    highlight = {
      multiline = true,
      before = "",
      keyword = "wide",
      after = "fg=#7b8496",
    },
  },
}
