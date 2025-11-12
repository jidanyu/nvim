
return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.json  = { "prettierd", "prettier", "deno_fmt", "jq", stop_after_first = true }
      opts.formatters_by_ft.jsonc = { "prettierd", "prettier", "deno_fmt", stop_after_first = true }
    end,
  },
}
