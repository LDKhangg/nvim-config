return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      go = { "golangcilint" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      python = { "flake8" },
    }

    -- Chỉ lint khi save: golangcilint rất nặng, chạy mỗi InsertLeave/BufEnter gây lag
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("UserLintConfig", {}),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
