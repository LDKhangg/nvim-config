return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Đảm bảo nó load trước các plugin khác
    lazy = false,    -- Load ngay khi mở Neovim
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- đồng bộ với tmux bar
        transparent_background = true,
        show_end_of_buffer = false,
        term_colors = true,
        integrations = {
          blink_cmp = true,
          gitsigns = true,
          neotree = true,
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          which_key = true,
        },
      })

      vim.cmd.colorscheme("catppuccin-mocha")

      -- Palette catppuccin mocha
      local overlay = "#7f849c"
      local red = "#f38ba8"
      local peach = "#fab387"
      local yellow = "#f9e2af"
      local green = "#a6e3a1"
      local teal = "#94e2d5"
      local mauve = "#cba6f7"
      local text = "#cdd6f4"
      local surface0 = "#313244"
      local mantle = "#181825"

      local blue = "#89b4fa"
      local H = vim.api.nvim_set_hl
      -- Go vivid: keyword đỏ, type vàng, func xanh lá, param/field teal
      local function apply_go()
        H(0, "@keyword.go", { fg = red, bold = true })
        H(0, "@keyword.function.go", { fg = red, bold = true })
        H(0, "@keyword.return.go", { fg = red, bold = true })
        H(0, "@type.go", { fg = yellow, bold = true })
        H(0, "@type.builtin.go", { fg = red })
        H(0, "@function.go", { fg = green, bold = true })
        H(0, "@function.method.go", { fg = green })
        H(0, "@function.call.go", { fg = green })
        H(0, "@variable.parameter.go", { fg = teal })
        H(0, "@property.go", { fg = teal })
        H(0, "@field.go", { fg = teal })
        H(0, "@string.go", { fg = green })
        H(0, "@number.go", { fg = peach })
        H(0, "@comment.go", { fg = overlay, italic = true })
      end
      -- diagnostic inline cuối dòng: chữ đỏ/vàng trên nền tối
      local function apply_diag()
        H(0, "DiagnosticVirtualTextError", { fg = red, bg = "#37222a" })
        H(0, "DiagnosticVirtualTextWarn", { fg = yellow, bg = "#383021" })
      end
      local function apply_neotree()
        H(0, "NeoTreeDirectoryName", { fg = blue })
        H(0, "NeoTreeDirectoryIcon", { fg = blue })
        H(0, "NeoTreeRootName", { fg = text, bold = true })
        H(0, "NeoTreeGitAdded", { fg = green })
        H(0, "NeoTreeGitModified", { fg = yellow })
        H(0, "NeoTreeGitDeleted", { fg = red })
        H(0, "NeoTreeExpander", { fg = blue })
        H(0, "NeoTreeCursorLine", { bg = surface0 })
        H(0, "NeoTreeWinSeparator", { fg = mantle, bg = "NONE" })
        H(0, "NeoTreeFloatTitle", { fg = mantle, bg = mauve, bold = true })
      end

      local ns = vim.api.nvim_create_augroup("CatppuccinCustom", { clear = true })
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
