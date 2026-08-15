return {
  {
    "scottmckendry/cyberdream.nvim",
    priority = 1000, -- Đảm bảo nó load trước các plugin khác
    lazy = false,    -- Load ngay khi mở Neovim
    config = function()
      require("cyberdream").setup({
        variant = "default",
        transparent = true,
        saturation = 1,
        italic_comments = false,
        borderless_pickers = false,
        terminal_colors = true,
        overrides = function(colors)
          return {
            NeoTreeNormal = { bg = "NONE", fg = colors.fg },
            NeoTreeNormalNC = { bg = "NONE", fg = colors.fg },
            NeoTreeEndOfBuffer = { bg = "NONE", fg = colors.bg },
            NeoTreeWinSeparator = { bg = "NONE", fg = colors.bg_highlight },
            NeoTreeCursorLine = { bg = colors.bg_alt },
            NeoTreeDirectoryName = { fg = colors.pink },
            NeoTreeDirectoryIcon = { fg = colors.pink },
            NeoTreeRootName = { fg = colors.fg, bold = true },
            NeoTreeFileName = { fg = colors.fg },
            NeoTreeFileNameOpened = { fg = colors.fg },
            NeoTreeFileIcon = { fg = colors.grey },
            NeoTreeDimText = { fg = colors.grey },
            NeoTreeHiddenByName = { fg = colors.grey },
            NeoTreeIndentMarker = { fg = colors.bg_highlight },
            NeoTreeExpander = { fg = colors.pink },
            NeoTreeGitAdded = { fg = colors.green },
            NeoTreeGitModified = { fg = colors.orange },
            NeoTreeGitDeleted = { fg = colors.red },
            NeoTreeFloatBorder = { fg = colors.bg_highlight, bg = "NONE" },
            NeoTreeFloatTitle = { fg = colors.bg, bg = colors.blue, bold = true },
            NeoTreeTitleBar = { fg = colors.fg, bg = "NONE", bold = true },
          }
        end,
      })

      vim.cmd.colorscheme("cyberdream")
    end,
  },
}
