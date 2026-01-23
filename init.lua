-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  -- 1) 关闭普通滚动的平滑动画（Ctrl-d/u、鼠标滚轮等）
  vim.g.neovide_scroll_animation_length = 0

  -- 2) 关闭“跨屏/大跳转”时末尾那几行的动画（建议也关掉）
  vim.g.neovide_scroll_animation_far_lines = 0
end
