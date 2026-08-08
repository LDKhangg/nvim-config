vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", ":Telescope commands<CR>", { desc = "Command Palette" })
keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close buffer" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set('n', '<c-k>', ':wincmd k<CR>')
keymap.set('n', '<c-j>', ':wincmd j<CR>')
keymap.set('n', '<c-h>', ':wincmd h<CR>')
keymap.set('n', '<c-l>', ':wincmd l<CR>')
keymap.set("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "Format file" })

-- terminal (toggleterm)
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Terminal vertical" })
keymap.set("n", "<leader>ft", "<cmd>ToggleTerm direction=float<CR>", { desc = "Terminal float" })

-- thoát + đóng terminal nhanh (jk trong terminal mode)
keymap.set("t", "jk", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
  vim.cmd("ToggleTerm")
end, { desc = "Exit and close terminal" })
-- điều hướng cửa sổ khi đang trong terminal mode
keymap.set("t", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Window left" })
keymap.set("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Window down" })
keymap.set("t", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Window up" })
keymap.set("t", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Window right" })

-- DAP (nvim-dap + nvim-dap-go)
keymap.set("n", "<leader>dt", function()
  require("dap-go").debug_test()
end, { desc = "Debug nearest test" })
keymap.set("n", "<leader>dT", function()
  require("dap-go").debug_last_test()
end, { desc = "Debug last test" })
keymap.set("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Continue" })
keymap.set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
keymap.set("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Step over" })
keymap.set("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step into" })
keymap.set("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "Step out" })
keymap.set("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "Toggle DAP UI" })
