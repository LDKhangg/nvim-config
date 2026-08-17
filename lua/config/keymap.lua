vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local set = keymap.set

set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

set("n", "<leader>to", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- move current buffer to new tab

set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent files" })
set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Find text" })
set("n", "<leader>fc", ":Telescope commands<CR>", { desc = "Command Palette" })

-- barbar
set("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
set("n", "<A-.>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", { desc = "Move buffer left" })
set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", { desc = "Move buffer right" })
set("n", "<A-p>", "<Cmd>BufferPin<CR>", { desc = "Pin buffer" })
set("n", "<A-c>", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
set("n", "<C-p>", "<Cmd>BufferPick<CR>", { desc = "Pick buffer" })

set("n", "<leader>x", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
set("n", "<leader>bn", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
set("n", "<leader>bp", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
set("n", "<leader>bm", "<Cmd>BufferMoveNext<CR>", { desc = "Move buffer right" })
set("n", "<leader>bM", "<Cmd>BufferMovePrevious<CR>", { desc = "Move buffer left" })
set("n", "<leader>bc", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
set("n", "<leader>bi", "<Cmd>BufferPin<CR>", { desc = "Pin buffer" })
set("n", "<leader>bb", "<Cmd>BufferPick<CR>", { desc = "Pick buffer" })
set("n", "<leader>bl", "<Cmd>BufferLast<CR>", { desc = "Last buffer" })

for i = 1, 9 do
  set("n", "<leader>b" .. i, "<Cmd>BufferGoto " .. i .. "<CR>", { desc = "Buffer " .. i })
end
set("n", "<leader>b0", "<Cmd>BufferLast<CR>", { desc = "Last buffer" })

set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
set('n', '<c-k>', ':wincmd k<CR>')
set('n', '<c-j>', ':wincmd j<CR>')
set('n', '<c-h>', ':wincmd h<CR>')
set('n', '<c-l>', ':wincmd l<CR>')
set("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "Format file" })

-- terminal (toggleterm)
set("n", "<leader>ot", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
set("n", "<leader>ov", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Terminal vertical" })
set("n", "<leader>of", "<cmd>ToggleTerm direction=float<CR>", { desc = "Terminal float" })

-- thoát + đóng terminal nhanh (jk trong terminal mode)
set("t", "jk", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
  vim.cmd("ToggleTerm")
end, { desc = "Exit and close terminal" })
-- điều hướng cửa sổ khi đang trong terminal mode
set("t", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Window left" })
set("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Window down" })
set("t", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Window up" })
set("t", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Window right" })

-- DAP (nvim-dap + nvim-dap-go)
set("n", "<leader>dt", function()
  require("dap-go").debug_test()
end, { desc = "Debug nearest test" })
set("n", "<leader>dT", function()
  require("dap-go").debug_last_test()
end, { desc = "Debug last test" })
set("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Continue" })
set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
set("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Step over" })
set("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step into" })
set("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "Step out" })
set("n", "<leader>du", function()
    require("dapui").toggle()
  end, { desc = "Toggle DAP UI" })

-- Java & Spring Boot
set("n", "<leader>jr", "<cmd>SpringBootRun<CR>", { desc = "Run Spring Boot App" })
set("n", "<leader>jo", function() require("jdtls").organize_imports() end, { desc = "Organize Imports" })
set("n", "<leader>jv", function() require("jdtls").test_class() end, { desc = "Run Java Test Class" })
set("n", "<leader>jm", function() require("jdtls").test_nearest_method() end, { desc = "Run Nearest Test Method" })
