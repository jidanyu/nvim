return {
  -- -- 安装并加载 kanagawa
  -- {
  --   "rebelot/kanagawa.nvim",
  --   name = "kanagawa",
  --   lazy = false, -- 启动即加载，这样 <leader>u c 列表里也能看到
  --   priority = 1000, -- 先于其他主题加载
  --   opts = {
  --     theme = "wave", -- 可选: "wave" | "dragon" | "lotus"
  --     transparent = false,
  --     terminalColors = true,
  --     -- 去掉侧边/浮窗的“ gutter 背景块 ”（常见美化）
  --     colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
  --     -- 可选：覆写高亮
  --     overrides = function(colors)
  --       local theme = colors.theme
  --       return {
  --         NormalFloat = { bg = "none" },
  --         FloatBorder = { fg = theme.ui.float.fg_border, bg = "none" },
  --         CursorLine = { bg = theme.ui.bg_p1 },
  --       }
  --     end,
  --   },
  -- },
  -- -- 告诉 LazyVim 用它当默认 colorscheme
  -- { "LazyVim/LazyVim", opts = { colorscheme = "kanagawa" } }, -- 等同 :colorscheme kanagawa

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
