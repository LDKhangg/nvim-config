return {
  "Zeioth/markmap.nvim",
  build = function()
    local target = vim.fn.stdpath("data") .. "/markmap-cli"
    vim.fn.mkdir(target, "p")
    vim.fn.system({ "npm", "install", "--prefix", target, "markmap-cli@0.18.12" })
  end,
  cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
  ft = { "markdown" },
  init = function()
    local set = vim.keymap.set

    local function save_and_run(cmd)
      if vim.bo.filetype == "markdown" and vim.fn.expand("%") == "" then
        vim.notify("Vui lòng lưu file Markdown trước khi mở Mindmap", vim.log.levels.WARN)
        return
      end
      if vim.bo.modified then
        vim.cmd("write")
      end
      vim.cmd(cmd)
    end

    set("n", "<leader>mo", function()
      save_and_run("MarkmapOpen")
    end, { desc = "Mở Mindmap (Markmap)" })

    set("n", "<leader>mw", function()
      save_and_run("MarkmapWatch")
    end, { desc = "Theo dõi Mindmap (Markmap Watch)" })

    set("n", "<leader>ms", function()
      if vim.fn.exists(":MarkmapWatchStop") == 2 then
        vim.cmd("MarkmapWatchStop")
      end
    end, { desc = "Dừng theo dõi Mindmap" })

    set("n", "<leader>mx", function()
      vim.fn.jobstart({ "/usr/bin/zen-browser", "https://excalidraw.com/" }, { detach = true })
    end, { desc = "Mở Excalidraw (Bảng vẽ tự do)" })
  end,
  config = function()
    -- Set BROWSER to Zen Browser so markmap opens Zen
    vim.env.BROWSER = "/usr/bin/zen-browser"

    local target = vim.fn.stdpath("data") .. "/markmap-cli"
    local local_cli = target .. "/node_modules/.bin/markmap"

    if vim.fn.executable(local_cli) ~= 1 then
      vim.fn.mkdir(target, "p")
      vim.fn.system({ "npm", "install", "--prefix", target, "markmap-cli@0.18.12" })
    end

    require("markmap").setup({
      html_output = "/tmp/markmap.html",
      hide_toolbar = false,
      grace_period = 3600000,
    })

    -- Ensure markmap_cmd uses local CLI
    local config = vim.g.markmap_config
    if type(config) == "table" then
      config.markmap_cmd = local_cli
      vim.g.markmap_config = config
    end
  end,
}
