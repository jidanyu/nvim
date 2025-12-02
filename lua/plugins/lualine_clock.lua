-- ~/.config/nvim/lua/plugins/lualine_clock.lua
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local function clock()
        -- 想带图标就：
        return " " .. os.date("%m-%d %H:%M")
        -- 不想要图标就：
        -- return os.date("%m-%d %H:%M")
      end

      opts.sections = opts.sections or {}

      -- 🔴 直接覆盖原来的 lualine_z，干掉默认的那个小钟
      opts.sections.lualine_z = { clock }
    end,
  },
}
