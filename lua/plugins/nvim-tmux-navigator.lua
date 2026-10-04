return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Tmux/nvim left" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Tmux/nvim down" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Tmux/nvim up" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Tmux/nvim right" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Tmux/nvim previous" },
  },
}
