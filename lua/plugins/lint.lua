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

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("UserLintConfig", {}),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
