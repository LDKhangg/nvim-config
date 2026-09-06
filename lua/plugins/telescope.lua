return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", function() builtin.find_files({ hidden = true }) end, { desc = "Find files (including hidden)" })
        vim.keymap.set("n", "<leader>fa", function() builtin.find_files({ hidden = true, no_ignore = true }) end, { desc = "Find all files (hidden & ignored)" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    end,
}
