return{
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header (logo)
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Menu buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  Toggle file explorer", "<cmd>Neotree toggle<CR>"),
      dashboard.button("SPC ff", "󰱼  Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fg", "󰈞  Find text", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC fr", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("SPC cs", "  Config", "<cmd>cd ~/.config/nvim | Telescope find_files<CR>"),
      dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
      dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    }

    -- Footer
    dashboard.section.footer.val = {
      "",
      "⚡ Neovim loaded successfully ⚡",
    }

    alpha.setup(dashboard.opts)

    -- disable folding
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
