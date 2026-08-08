-- Custom indentexpr cho Go.
-- GoIndent (nvim runtime) trả về indent(prev) = 0 khi khối đóng trên cùng dòng
-- (vd: `func main() {}` rồi Enter) -> nhảy về cột 0. Mình xử lý kiểu VSCode:
-- khối {} đóng trên cùng dòng vẫn coi là "mở" -> thụt vào +1 cấp.
-- Các trường hợp còn lại ủy quyền cho GoIndent.

local M = {}

function M.go_indent(lnum)
  lnum = lnum or vim.v.lnum
  local prev = vim.fn.prevnonblank(lnum - 1)
  if prev > 0 then
    local line = vim.fn.getline(prev)
    if not line:find("//", 1, true) and line:match("%{%s*%}$") then
      return vim.fn.indent(prev) + vim.fn.shiftwidth()
    end
  end
  if vim.fn.exists("*GoIndent") == 1 then
    return vim.fn["GoIndent"](lnum)
  end
  return vim.fn.indent(prev)
end

return M
