local repo = vim.fn.stdpath("data") .. "/nvim-config"
local remote = "https://github.com/LDKhangg/nvim-config.git"
local uv = vim.uv or vim.loop

if not uv.fs_stat(repo) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    remote,
    repo,
  })
end

if vim.v.shell_error ~= 0 then
  vim.api.nvim_echo({ { "Failed to clone nvim-config", "ErrorMsg" } }, true, {})
  return
end

vim.cmd("source " .. vim.fn.fnameescape(repo .. "/init.lua"))
