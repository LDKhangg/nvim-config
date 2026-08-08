return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Đảm bảo nó load trước các plugin khác
    lazy = false,    -- Load ngay khi mở Neovim
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, 
        integrations = {
          telescope = true,
          neotree = true,
          treesitter = true,
          mason = true,
          indent_blankline = {
            enabled = true,
          },
        },
      })


      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
}
