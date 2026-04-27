return {
  "stevearc/conform.nvim",
  -- event = { "BufWritePre" },
  opts = {
    async = true,
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 2500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      -- Use a sub-list to run only the first available formatter
      -- lua = { 'stylua' },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascript = { "prettier", stop_after_first = true },
      css = { "prettier", stop_after_first = true },
    },
  },
}
