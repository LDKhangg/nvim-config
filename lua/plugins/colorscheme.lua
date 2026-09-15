return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000, -- Đảm bảo nó load trước các plugin khác
    lazy = false,    -- Load ngay khi mở Neovim
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_better_performance = 1

      vim.cmd.colorscheme("gruvbox-material")

      -- Palette gruvbox-material (dark / hard / original) — đậm hơn soft/material
      local bg0 = "#1d2021"
      local bg1 = "#282828"
      local bg2 = "#282828"
      local bg3 = "#3c3836"
      local fg0 = "#d4be98"
      local fg1 = "#ddc7a1"
      local grey1 = "#928374"
      local red = "#ea6962"
      local orange = "#e78a4e"
      local yellow = "#d8a657"
      local green = "#a9b665"
      local aqua = "#89b482"

      local H = vim.api.nvim_set_hl
      -- Go vivid như ảnh mẫu: keyword đỏ, type vàng, func xanh lá, param/field teal
      local function apply_go()
        H(0, "@keyword.go", { fg = red, bold = true })
        H(0, "@keyword.function.go", { fg = red, bold = true })
        H(0, "@keyword.return.go", { fg = red, bold = true })
        H(0, "@type.go", { fg = yellow, bold = true })
        H(0, "@type.builtin.go", { fg = red })
        H(0, "@function.go", { fg = green, bold = true })
        H(0, "@function.method.go", { fg = green })
        H(0, "@function.call.go", { fg = green })
        H(0, "@variable.parameter.go", { fg = aqua })
        H(0, "@property.go", { fg = aqua })
        H(0, "@field.go", { fg = aqua })
        H(0, "@string.go", { fg = green })
        H(0, "@number.go", { fg = orange })
        H(0, "@comment.go", { fg = grey1, italic = true })
      end
      -- diagnostic inline cuối dòng: chữ đỏ/vàng trên nền tối (giống ảnh mẫu)
      local function apply_diag()
        H(0, "DiagnosticVirtualTextError", { fg = red, bg = "#37211e" })
        H(0, "DiagnosticVirtualTextWarn", { fg = yellow, bg = "#33291a" })
      end
      local function apply_neotree()
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
      end

      -- gruvbox-material kèm after/syntax/neo-tree ghi đè các group này
      -- khi tree mở; vim.schedule defer để re-apply sau khi after/syntax xong
      local ns = vim.api.nvim_create_augroup("GruvboxNeoTree", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
        group = ns,
        pattern = "neo-tree*",
        callback = function()
          vim.schedule(apply_neotree)
        end,
      })

      apply_neotree()
      apply_go()
      apply_diag()
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = ns,
        callback = function()
          apply_neotree()
          apply_go()
          apply_diag()
        end,
      })
    end,
  },
}
