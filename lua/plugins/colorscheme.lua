return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000, -- Đảm bảo nó load trước các plugin khác
    lazy = false,    -- Load ngay khi mở Neovim
    config = function()
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_enable_italic = 0
      vim.g.gruvbox_material_ui_contrast = "low"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_better_performance = 1

      vim.cmd.colorscheme("gruvbox-material")

      -- Palette gruvbox-material (dark / soft / material)
      local bg0 = "#32302f"
      local bg1 = "#3c3836"
      local bg2 = "#3c3836"
      local bg3 = "#504945"
      local fg0 = "#d4be98"
      local fg1 = "#ddc7a1"
      local grey1 = "#928374"
      local red = "#ea6962"
      local orange = "#e78a4e"
      local yellow = "#d8a657"
      local green = "#a9b665"

      local H = vim.api.nvim_set_hl
      H(0, "NeoTreeNormal", { bg = "NONE", fg = fg0 })
      H(0, "NeoTreeNormalNC", { bg = "NONE", fg = fg0 })
      H(0, "NeoTreeEndOfBuffer", { bg = "NONE", fg = bg0 })
      H(0, "NeoTreeWinSeparator", { bg = "NONE", fg = bg1 })
      H(0, "NeoTreeCursorLine", { bg = bg1 })
      H(0, "NeoTreeDirectoryName", { fg = orange })
      H(0, "NeoTreeDirectoryIcon", { fg = orange })
      H(0, "NeoTreeRootName", { fg = fg0, bold = true })
      H(0, "NeoTreeFileName", { fg = fg0 })
      H(0, "NeoTreeFileNameOpened", { fg = fg1 })
      H(0, "NeoTreeFileIcon", { fg = grey1 })
      H(0, "NeoTreeDimText", { fg = grey1 })
      H(0, "NeoTreeHiddenByName", { fg = grey1 })
      H(0, "NeoTreeIndentMarker", { fg = bg3 })
      H(0, "NeoTreeExpander", { fg = orange })
      H(0, "NeoTreeGitAdded", { fg = green })
      H(0, "NeoTreeGitModified", { fg = yellow })
      H(0, "NeoTreeGitDeleted", { fg = red })
      H(0, "NeoTreeFloatBorder", { fg = bg3, bg = "NONE" })
      H(0, "NeoTreeFloatTitle", { fg = bg0, bg = orange, bold = true })
      H(0, "NeoTreeTitleBar", { fg = fg0, bg = "NONE", bold = true })
    end,
  },
}
