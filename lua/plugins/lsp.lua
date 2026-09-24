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
            -- tắt tự điền placeholder param khi accept completion (khó chịu)
            usePlaceholders = false,
            completeUnimported = true,
            deepCompletion = true,
            matcher = "Fuzzy",
            -- codelens: nút run test / tidy / vendor inline
            codelenses = {
              generate = true,
              gc_details = false,
              test = true,
              tidy = true,
              vendor = true,
              regenerate_cgo = true,
              upgrade_dependency = true,
            },
            -- inlay hints: hiện type param, composite field
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      })

      vim.lsp.enable({ "gopls", "lua_ls", "pyright", "ts_ls" })
    end,
  },
}
