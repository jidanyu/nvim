-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.guifont = "JetBrainsMono Nerd Font:h10" -- 设置 Nerd Font 字体和字号
if vim.fn.has("win32") == 1 then
  vim.o.guifont = "Consolas Nerd Font:h12"
else
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
end
-- 只在 Neovide GUI 下生效
if vim.g.neovide then
  -- 启动时全屏
  vim.g.neovide_fullscreen = true
end

-- 固定启动目录（无论从哪里打开 nvim）
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- 仅在 Windows 上切换到 D:，避免 Linux 没有 D: 盘导致报错
    if vim.fn.has("win32") == 1 and vim.fn.isdirectory("D:/") == 1 then
      vim.cmd.cd(vim.fn.expand("D:/")) -- 改成你想要的目录
    end
  end,
})

--
