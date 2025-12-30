
-- 禁用 dartls 的 snippet 补全，让 logInfo 只补函数名，不带 message 这种占位参数
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        dartls = function(_, opts)
          -- 先拿到一份默认 capabilities（如果你启用了 nvim-cmp / blink 之类，也没关系）
          local capabilities = vim.lsp.protocol.make_client_capabilities()

          -- 关键：关掉 snippetSupport
          capabilities.textDocument.completion.completionItem.snippetSupport = false

          -- 合并回 dartls 的配置里
          opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities or {}, capabilities)
        end,
      },
    },
  },
}
