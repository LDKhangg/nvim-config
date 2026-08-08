return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    pcall(function()
      require("nvim-treesitter").install({
        "go",
        "gomod",
        "gowork",
        "java",
        "python",
        "javascript",
        "typescript",
        "lua",
        "html",
        "css",
        "bash",
        "markdown",
      })
    end)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "go", "gomod", "gowork", "java", "python", "javascript", "typescript", "lua", "html", "css", "bash", "markdown" },
      callback = function()
        pcall(vim.treesitter.start)
        if vim.tbl_contains({ "go", "gomod", "gowork" }, vim.bo.filetype) then
          vim.bo.indentexpr = "v:lua.require'config.indent'.go_indent()"
        end
      end,
    })
  end,
}
