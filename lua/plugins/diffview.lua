return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview open" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<CR>", desc = "Diffview history" },
    { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Diffview close" },
  },
  config = function()
    require("diffview").setup()
  end,
}
