return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")
    npairs.setup({
      check_ts = true, -- sử dụng treesitter để check context (tránh tự động đóng trong string/comment)
      ts_config = {
        lua = { "string", "source" },
        javascript = { "template_string" },
      },
      disable_filetype = { "TelescopePrompt", "vim" },
    })

    -- Tự động xuống dòng và thụt lề khi bấm Enter giữa cặp ngoặc {} [] ()
    local rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')

    npairs.add_rules({
      rule("{", "}")
        :with_pair(cond.not_after_text("}"))
        :with_move(function(opts)
          return opts.prev_char_class == "}%"
        end)
    })

    -- Mapping phím Enter (<CR>) chuẩn theo nvim-autopairs
    _G.MUtils = {}

    MUtils.CR = function()
      if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
          return npairs.esc('<c-y>')
        else
          return npairs.esc('<c-e>') .. npairs.autopairs_cr()
        end
      else
        return npairs.autopairs_cr()
      end
    end

    vim.keymap.set('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })
  end,
}
