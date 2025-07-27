local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    --python = {"black", "flake8"},
    python = { "black", "ruff" },
    java = { "google_java_format" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    --   -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
