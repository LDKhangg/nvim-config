return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        width = 34,
      },
      default_component_configs = {
        indent = {
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          expander_collapsed = "",
          expander_expanded = "",
        },
        icon = {
          folder_closed = "󰉋",
          folder_open = "󰝰",
          folder_empty = "󰉖",
          folder_empty_open = "󰷏",
          default = "󰈔",
          highlight = "NeoTreeFileIcon",
        },
        name = {
          highlight = "NeoTreeFileName",
          use_git_status_colors = false,
          use_filtered_colors = false,
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true, -- Tự động focus và expand đến file đang mở
          leave_dirs_open = true,
        },
      },
    })
  end,
}
