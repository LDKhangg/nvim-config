-- Air: live-reload cho Go (chạy trong terminal split của nvim)
local keymap = vim.keymap

local function air_window_exists()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match("air$") then
      return true
    end
  end
  return false
end

local function start_air()
  if air_window_exists() then
    vim.notify("air đang chạy rồi", vim.log.levels.INFO)
    return
  end
  local dir = vim.fn.getcwd()
  vim.cmd("botright split | resize 12")
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(buf)
  vim.api.nvim_buf_set_name(buf, "air")
  vim.bo.bufhidden = "hide"
  vim.bo.swapfile = false
  vim.keymap.set("t", "q", "<cmd>close<CR>", { buffer = buf, desc = "Close air terminal" })
  vim.fn.termopen(vim.o.shell .. " -c 'cd " .. vim.fn.shellescape(dir) .. " && air'")
  vim.cmd("startinsert")
end

local function stop_air()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match("air$") then
      vim.api.nvim_win_close(win, true)
    end
  end
end

keymap.set("n", "<leader>ra", start_air, { desc = "Start air (live reload)" })
keymap.set("n", "<leader>rq", stop_air, { desc = "Stop air" })
