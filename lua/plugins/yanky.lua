return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    { "<leader>fy", "<cmd>YankyRingHistory<CR>", desc = "Yank history" },
  },
  config = function()
    require("yanky").setup({
      ring = {
        history_length = 100,
        storage = "shada",
        sync_with_numbered_registers = true,
        cancel_event = "update",
        ignore_registers = { "_" },
      },
      picker = {
        select = { "telescope", "fzf_lua" },
        telescope = {
          mappings = {
            default = require("yanky.telescope.mapping").put("p"),
            i = {
              ["<c-p>"] = require("yanky.telescope.mapping").put("p"),
              ["<c-n>"] = require("yanky.telescope.mapping").put("P"),
            },
          },
        },
      },
    })

    vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "Paste after (yanky)" })
    vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "Paste before (yanky)" })
    vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", { desc = "Paste after, keep cursor" })
    vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", { desc = "Paste before, keep cursor" })
    vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleForward)", { desc = "Cycle forward through yank history" })
    vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleBackward)", { desc = "Cycle backward through yank history" })
  end,
}
