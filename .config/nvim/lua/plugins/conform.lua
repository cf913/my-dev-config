return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      -- Use a sub-list to run only the first available formatter
      -- lua = { 'stylua' },
      typescriptreact = { "prettier", "prettierd", stop_after_first = true },
      typescript = { "prettier", "prettierd", stop_after_first = true },
      javascript = { "prettier", stop_after_first = true },
      css = { "prettier", stop_after_first = true },
    },
  },
}
