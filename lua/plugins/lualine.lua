-- 强制在状态栏显示 Git 分支与 diff（不依赖 LazyVim 的 util）
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- 保险的分支组件：优先用 gitsigns 的变量
    local function git_head()
      return vim.b.gitsigns_head or (vim.b.gitsigns_status_dict and vim.b.gitsigns_status_dict.head) or ""
    end

    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = {
        { git_head, icon = "" }, -- 分支
        "diff", -- gitsigns 提供改动统计
        "diagnostics",
      },
      -- 用文件名（相对路径），别再调用 LazyVim 的 root_dir 辅助
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    }
    -- 可选：保留已有 options（主题等），不必重置
  end,
}
