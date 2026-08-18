return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",
          "kotlin-language-server",
          "lua_ls",
          "pyright",
          "ts_ls",
        },
      })

      local playground_root = vim.fs.normalize(vim.fn.expand("~/Dev/go-playground"))

      vim.lsp.config("gopls", {
        before_init = function(_, config)
          if config.root_dir and vim.fs.normalize(config.root_dir) == playground_root then
            config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
              gopls = { buildFlags = { "-tags=exercise" } },
            })
          end
        end,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = false,
            gofumpt = true,
          },
        },
      })

      vim.lsp.enable({ "gopls", "kotlin_language_server", "lua_ls", "pyright", "ts_ls" })
    end,
  },
}
