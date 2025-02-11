return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      -- Use a sub-list to run only the first available formatter
      -- lua = { 'stylua' },
      javascript = { "prettier", stop_after_first = true },
      typescript = { "prettier", stop_after_first = true },
      typescriptreact = { "prettier", stop_after_first = true },
      css = { "prettier", stop_after_first = true },
    },
  },
}
