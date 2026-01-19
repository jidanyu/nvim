return {
  {
    "nvim-flutter/flutter-tools.nvim",
    optional = true,
    keys = {
      {
        "<leader>rd",
        function()
          -- Run with Debug (Flutter)
          if pcall(vim.cmd, "FlutterDebug") then
            return
          end
          -- fallback: if no flutter-tools, try DAP
          pcall(function()
            require("dap").continue()
          end)
        end,
        desc = "Run with Debug (Flutter)",
      },
      {
        "<leader>rr",
        function()
          -- Run without Debug (Flutter)
          if pcall(vim.cmd, "FlutterRun") then
            return
          end
          -- fallback: no flutter-tools -> you can customize later
          vim.notify("No FlutterRun available (install flutter-tools.nvim)", vim.log.levels.WARN)
        end,
        desc = "Run (no Debug) (Flutter)",
      },
    },
  },

  -- 兜底：就算你暂时没装 flutter-tools，也能让 <leader>rd 走 DAP
  {
    "mfussenegger/nvim-dap",
    optional = true,
    keys = {
      {
        "<leader>rd",
        function()
          require("dap").continue()
        end,
        desc = "Run with Debug (DAP)",
      },
    },
  },
}
