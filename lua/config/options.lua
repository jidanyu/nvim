-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.guifont = "JetBrainsMono Nerd Font:h10" -- 设置 Nerd Font 字体和字号

-- 只在 Neovide GUI 下生效
if vim.g.neovide then
  -- 启动时全屏
  vim.g.neovide_fullscreen = true
end
