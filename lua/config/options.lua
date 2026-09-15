vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true -- số nhảy theo cursor (44j/12k nhanh), dòng cursor vẫn hiện số tuyệt đối
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true -- auto-indent after lines ending in { and similar

opt.wrap = false -- code: keep long lines on one line

-- markdown (README...) không tự wrap là khó đọc -> bật wrap + ngắt theo từ
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.mdx" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true
opt.showtabline = 2 -- luôn hiện tabline barbar (kể cả 1 buffer, dashboard)

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes:1" -- chỉ chừa đúng 1 cell cho sign (không cho giãn), text không nhảy
opt.numberwidth = 2 -- cột số chỉ chừa tối thiểu 2 ký tự (mặc định 4 nên gutter rộng)

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard = "unnamedplus" -- sync với X11 clipboard (xclip)

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- undo persists across sessions (dùng chung với undotree)
opt.undofile = true

-- keymap chờ prefix nhanh (tránh lag khi gõ <leader>r, <leader>d...)
opt.timeoutlen = 300

-- CursorHold (auto float diagnostic) fire sớm; mặc định 4000ms là quá lâu
opt.updatetime = 250

-- Tự reload file khi bị sửa từ bên ngoài (agent AI, git checkout...)
-- nếu không có cái này thì buffer giữ nội dung cũ, phải :e! / đóng mở tab
opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.fn.getcmdwintype() == "" then
      vim.cmd("checktime")
    end
  end,
  desc = "Auto-reload file changed outside nvim",
})
