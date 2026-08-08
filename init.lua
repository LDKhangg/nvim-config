-- 1. Load các settings cơ bản
require("config.options")

-- 2. Load phím tắt
require("config.keymap")

-- 3. Load lsp keymaps & diagnostics
require("config.lsp")

-- 3.5. Load air (live reload cho Go)
require("config.air")

-- 3.6. Load go test panel (chạy test trong terminal split)
require("config.test")

-- 4. Boostrap load lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 5. Setup Lazy để load các file trong lua/plugins/
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- Tự động load mọi file .lua trong thư mục plugins
  },
  -- Tự động kiểm tra cập nhật cho ông luôn
  checker = { enabled = true },
})
