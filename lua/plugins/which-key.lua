return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({})
    wk.add({
      { "<leader>b", group = "buffers" },
      { "<leader>c", group = "code" },
      { "<leader>d", group = "debug" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>l", group = "lsp" },
      { "<leader>o", group = "terminal" },
      { "<leader>r", group = "run" },
      { "<leader>s", group = "split" },
      { "<leader>t", group = "tabs" },
      { "<leader>x", group = "diagnostics" },
    })

    wk.add({
      { "<leader>u", desc = "Undo tree" },
      { "<leader>fy", desc = "Yank history" },
      { "<leader>ft", desc = "Find TODO comments" },
      { "<leader>gd", desc = "Git diff" },
      { "<leader>gh", desc = "File history" },
      { "<leader>gc", desc = "Close diffview" },
      { "<leader>gg", desc = "Lazygit" },
    })
  end,
}
