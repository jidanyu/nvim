return {
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = { "dart" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      local function normalize_path(path)
        if not path or path == "" then
          return path
        end
        if vim.fs and vim.fs.normalize then
          return vim.fs.normalize(path)
        end
        return vim.loop.fs_realpath(path) or path
      end

      local function dart_root_dir(fname)
        local util = require("lspconfig.util")
        local root = util.root_pattern("pubspec.yaml", "analysis_options.yaml", ".git")(fname)
        return normalize_path(root)
      end

      require("flutter-tools").setup({
        debugger = {
          enabled = true,
        },
        lsp = {
          root_dir = dart_root_dir,
          on_new_config = function(config, root)
            config.root_dir = normalize_path(root)
            local settings = config.settings
            local dart = settings and settings.dart
            if dart and dart.analysisExcludedFolders then
              dart.analysisExcludedFolders = vim.tbl_map(normalize_path, dart.analysisExcludedFolders)
            end
          end,
        },
      })
    end,
  },
}
