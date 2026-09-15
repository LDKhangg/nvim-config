local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }

    opts.desc = "Show LSP references"
    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definition"
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Show LSP implementations"
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    opts.desc = "Code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Rename symbol"
    keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)

    opts.desc = "Buffer diagnostics"
    keymap.set("n", "<leader>xb", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    opts.desc = "Line diagnostics"
    keymap.set("n", "<leader>xx", vim.diagnostic.open_float, opts)

    keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)

    keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)

    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- inlay hints + codelens cho Go (gopls đã bật hints/codelens ở plugins/lsp.lua)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
    end
    if client and client:supports_method("textDocument/codeLens") then
      vim.lsp.codelens.enable(true, { bufnr = ev.buf })
      vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
        buffer = ev.buf,
        callback = function()
          vim.lsp.codelens.enable(true, { bufnr = ev.buf })
        end,
      })
      keymap.set("n", "<leader>cl", vim.lsp.codelens.run, { buffer = ev.buf, silent = true, desc = "Run codelens" })
    end

    -- auto-show float diagnostic khi trỏ đứng yên trên dòng có lỗi
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = ev.buf,
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable = false,
          close_events = { "CursorMoved", "BufLeave", "InsertEnter", "FocusLost" },
          border = "rounded",
          source = "always",
          prefix = " ",
          scope = "cursor",
        })
      end,
    })
  end,
})

local severity = vim.diagnostic.severity

vim.diagnostic.config({
  -- hiện lỗi inline cuối dòng luôn (không cần đợi cursor tới)
  virtual_text = {
    prefix = "■ ",
    spacing = 2,
    source = false,
    severity = { min = severity.WARN },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    prefix = " ",
  },
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})

-- NOTE: màu nền chữ lỗi inline nằm trong lua/plugins/colorscheme.lua (apply_diag)
-- vì colorscheme load sau và ghi đè highlight nếu để ở đây
