return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      indent = { char = "│" },
      scope = { enabled = true, underline = true },
      chunk = { enabled = true },
      animate = {
        enabled = true,
        style = "out",
        duration = { step = 20, total = 300 },
      },
      filter = function(buf)
        local exclude = {
          help = true,
          alpha = true,
          dashboard = true,
          ["neo-tree"] = true,
          NvimTree = true,
          Trouble = true,
          lazy = true,
          mason = true,
          notify = true,
          toggleterm = true,
        }
        if exclude[vim.bo[buf].filetype] then
          return false
        end
        return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
      end,
    },
  },
}
