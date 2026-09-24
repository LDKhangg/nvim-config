return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      list = {
        selection = { preselect = false, auto_insert = false },
      },
      documentation = { auto_show = true },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          -- gopls đôi khi trả cùng item 2 lần (deepCompletion) -> lọc trùng label+detail
          transform_items = function(_, items)
            local seen, out = {}, {}
            for _, item in ipairs(items) do
              local key = (item.label or "") .. "\0" .. (item.detail or "")
              if not seen[key] then
                seen[key] = true
                out[#out + 1] = item
              end
            end
            return out
          end,
        },
      },
    },
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },
}
