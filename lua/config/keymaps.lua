-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- 在插入模式下，按 jj 返回到正常模式

-- 插入模式：jj 退到 Normal（你原来的这行是对的）
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert" })

-- 终端模式：jj 退到 Normal（关键：用 <C-\><C-n>）
vim.keymap.set("t", "jj", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- 切换当前行的 - [ ] / - [x]（没有就自动加）
local function toggle_checkbox()
  local l = vim.api.nvim_get_current_line()
  local s = l:match("^%s*")
  if l:match("^%s*[%-%*]%s+%[%s%]") then
    l = l:gsub("^(%s*[%-%*]%s+)%[%s%]", "%1[x]", 1)
  elseif l:match("^%s*[%-%*]%s+%[x%]") then
    l = l:gsub("^(%s*[%-%*]%s+)%[x%]", "%1[ ]", 1)
  else
    l = s .. "- [ ] " .. l:sub(#s + 1)
  end
  vim.api.nvim_set_current_line(l)
end

vim.keymap.set("n", "<leader>xx", toggle_checkbox, { desc = "Toggle Markdown checkbox" })

-- Emacs-style in insert mode
-- 说明：
-- - 正常打字时：Ctrl-f/Ctrl-b = 光标左右；Ctrl-a/Ctrl-e = 行首/行尾（非空白）
-- - 补全菜单打开时：Ctrl-f/Ctrl-b 继续用于滚动补全文档（LazyVim 默认习惯）

local ok, cmp = pcall(require, "cmp")

-- 左/右
vim.keymap.set("i", "<C-b>", function()
  if ok and cmp.visible() then
    cmp.scroll_docs(-4)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left>", true, false, true), "n", false)
  end
end, { desc = "Emacs: backward-char" })

vim.keymap.set("i", "<C-f>", function()
  if ok and cmp.visible() then
    cmp.scroll_docs(4)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", false)
  end
end, { desc = "Emacs: forward-char" })

-- 行首 / 行尾（非空白 / 行尾）
vim.keymap.set("i", "<C-a>", "<C-o>^", { desc = "Emacs: beginning-of-line" })
vim.keymap.set("i", "<C-e>", "<C-o>$", { desc = "Emacs: end-of-line" })

-- 可选：命令行模式也用 Emacs 风格（输入 : 或 / 时）
-- vim.keymap.set("c", "<C-b>", "<Left>")
-- vim.keymap.set("c", "<C-f>", "<Right>")
-- vim.keymap.set("c", "<C-a>", "<Home>")
-- vim.keymap.set("c", "<C-e>", "<End>")

-- <leader>tb：在“当前文件目录”开终端
vim.keymap.set("n", "<leader>tb", function()
  local d = vim.fn.expand("%:p:h")
  vim.cmd("lcd " .. vim.fn.fnameescape(d))
  vim.cmd("botright split | resize 12 | terminal")
end, { desc = "Terminal @ buffer dir" })
