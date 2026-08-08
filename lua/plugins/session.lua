return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      suppressed_dirs = { "~/", "/", "~/Downloads", "/tmp" }, -- không lưu/restore session ở thư mục ồn ào (vd ~ gây lỗi restore)
      pre_save_cmds = {
        -- Xóa buffer neo-tree (cả zombie restore từ session cũ) trước khi lưu, nếu không sẽ E95 khi mở lại
        "lua for _, b in ipairs(vim.api.nvim_list_bufs()) do if vim.fn.bufname(b):match('^neo%-tree') then pcall(vim.api.nvim_buf_delete, b, { force = true }) end end",
        -- Xóa buffer trống không tên ([No Name]) trước khi lưu session
        "lua for _, b in ipairs(vim.api.nvim_list_bufs()) do if vim.api.nvim_buf_is_valid(b) and vim.bo[b].buftype == '' and vim.fn.bufname(b) == '' and not vim.bo[b].modified then pcall(vim.api.nvim_buf_delete, b, {}) end end",
      },
    })
  end,
}
