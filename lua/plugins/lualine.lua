return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      -- LazyVim default puts pretty_path in lualine_c[4]
      opts.sections.lualine_c[4] = {
        LazyVim.lualine.pretty_path({ length = 0 }),
      }
    end,
  },
}
