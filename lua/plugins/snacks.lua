-- ~/.config/nvim/lua/plugins/snacks.lua
return {
  "folke/snacks.nvim",
  opts = {
    -- 让 picker & explorer 默认就展示隐藏+忽略文件
    picker = {
      hidden = true, -- 显示 .gitignore、.cargo 这类
      ignored = true, -- 显示被 .gitignore 忽略的，比如 target/
    },
    explorer = {
      hidden = true,
      ignored = true,
    },
  },
}
