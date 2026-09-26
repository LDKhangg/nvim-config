-- Nhảy tới bất kỳ chỗ nào đang hiển thị: gs + gõ 1-2 ký tự,
-- mọi vị trí khớp hiện label (a/b/c...) -> nhấn label là tới.
-- Dùng chung với operator: dgs / ygs + gõ + label.
-- (Mặc định flash dùng phím s, nhưng s đang thuộc cutlass nên map sang gs.)
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "gs",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash jump",
    },
  },
}
