-- Go test panel: chạy test trong terminal split (giống air)
-- -tags=exercise: vô hại với app, cần cho bài tập (build tag exercise)
local keymap = vim.keymap

local function test_window_exists()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match("go test$") then
      return win
    end
  end
  return nil
end

local function run_test_panel()
  local existing = test_window_exists()
  if existing then
    vim.api.nvim_set_current_win(existing)
    return
  end
  local file_dir = vim.fn.expand("%:p:h")
  if file_dir == "" then
    file_dir = vim.fn.getcwd()
  end
  vim.cmd("botright split | resize 12")
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(buf)
  vim.api.nvim_buf_set_name(buf, "go test")
  vim.bo.bufhidden = "hide"
  vim.bo.swapfile = false
  vim.keymap.set("t", "q", "<cmd>close<CR>", { buffer = buf, desc = "Close go test panel" })
  vim.fn.termopen(vim.o.shell .. " -c 'cd " .. vim.fn.shellescape(file_dir) .. " && go test -count=1 -tags=exercise .'")
  vim.cmd("startinsert")
end

keymap.set("n", "<leader>rt", run_test_panel, { desc = "Open go test panel" })

return { run_test_panel = run_test_panel, test_window_exists = test_window_exists }
