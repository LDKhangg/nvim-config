return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
  ft = { "markdown", "quarto", "vimwiki" },
  opts = {
    file_types = { "markdown", "quarto" },
    heading = {
      enabled = true,
      sign = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
    code = {
      enabled = true,
      sign = false,
      style = "full",
      position = "left",
      width = "block",
      left_pad = 2,
      right_pad = 2,
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = "󰄱 " },
      checked = { icon = "󰱒 " },
    },
    dash = {
      enabled = true,
      icon = "─",
    },
    bullet = {
      icons = { "●", "○", "◆", "◇" },
    },
  },
}
