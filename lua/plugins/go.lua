return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "go", "gomod" },
    -- tự cài tools phụ (gomodifytags/impl/gotests/...) khi cài hoặc update plugin
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("go").setup({
        -- gopls do mình tự quản trong plugins/lsp.lua -> tắt để khỏi conflict
        lsp_cfg = false,
        lsp_gofumpt = true,
        lsp_inlay_hints = { enable = false },
        -- dùng -tags=exercise cho đồng bộ test panel / neotest
        test_runner = "go",
        run_in_floaterm = false,
        trouble = false,
        luasnip = false,
      })

      -- keymap Go-specific (buffer go): fill struct, impl iface, add tag, test
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function(ev)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
          end
          map("<leader>gf", "<cmd>GoFillStruct<CR>", "Go fill struct")
          map("<leader>gi", "<cmd>GoImpl ", "Go impl interface")
          map("<leader>ga", "<cmd>GoAddTag<CR>", "Go add tags")
          map("<leader>gr", "<cmd>GoRmTag<CR>", "Go remove tags")
          map("<leader>gt", "<cmd>GoTest -tags=exercise -v -count=1 -run .<CR>", "Go test package")
          map("<leader>gc", "<cmd>GoCoverage<CR>", "Go coverage")
        end,
      })
    end,
  },
}
