return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
    },
    ft = "go",
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-go")({
            -- -tags=exercise: khớp test panel cũ (config/test.lua), vô hại với app thường
            args = { "-count=1", "-tags=exercise" },
          }),
        },
        summary = {
          enabled = true,
          follow = true,
          expand_errors = true,
        },
      })
    end,
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Test nearest" },
      { "<leader>tF", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test file" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Test summary" },
      { "<leader>tO", function() require("neotest").output.open({ enter = true }) end, desc = "Test output" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Test re-run last" },
      { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug nearest test" },
      { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Test watch file" },
    },
  },
}
