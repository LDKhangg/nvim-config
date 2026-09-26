-- Syntax-aware motions: nhảy giữa các method + text object chọn cả function.
-- ]m / [m : đầu method kế tiếp / trước đó (lưu vào jumplist, Ctrl-O quay lại)
-- ]M / [M : cuối method kế tiếp / trước đó
-- ]] / [[ : đầu class/struct kế tiếp / trước đó
-- vam / yif / dac ... : chọn cả function (a) hoặc thân function (i),
--                        ac/ic tương tự cho class
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
      },
      move = {
        set_jumps = true,
      },
    })

    local select = require("nvim-treesitter-textobjects.select")
    local move = require("nvim-treesitter-textobjects.move")

    -- text objects
    vim.keymap.set({ "x", "o" }, "am", function()
      select.select_textobject("@function.outer", "textobjects")
    end, { desc = "Around method/function" })
    vim.keymap.set({ "x", "o" }, "im", function()
      select.select_textobject("@function.inner", "textobjects")
    end, { desc = "Inside method/function" })
    vim.keymap.set({ "x", "o" }, "ac", function()
      select.select_textobject("@class.outer", "textobjects")
    end, { desc = "Around class/struct" })
    vim.keymap.set({ "x", "o" }, "ic", function()
      select.select_textobject("@class.inner", "textobjects")
    end, { desc = "Inside class/struct" })

    -- nhảy giữa các method
    vim.keymap.set({ "n", "x", "o" }, "]m", function()
      move.goto_next_start("@function.outer", "textobjects")
    end, { desc = "Next method start" })
    vim.keymap.set({ "n", "x", "o" }, "[m", function()
      move.goto_previous_start("@function.outer", "textobjects")
    end, { desc = "Prev method start" })
    vim.keymap.set({ "n", "x", "o" }, "]M", function()
      move.goto_next_end("@function.outer", "textobjects")
    end, { desc = "Next method end" })
    vim.keymap.set({ "n", "x", "o" }, "[M", function()
      move.goto_previous_end("@function.outer", "textobjects")
    end, { desc = "Prev method end" })
    vim.keymap.set({ "n", "x", "o" }, "]]", function()
      move.goto_next_start("@class.outer", "textobjects")
    end, { desc = "Next class start" })
    vim.keymap.set({ "n", "x", "o" }, "[[", function()
      move.goto_previous_start("@class.outer", "textobjects")
    end, { desc = "Prev class start" })
  end,
}
