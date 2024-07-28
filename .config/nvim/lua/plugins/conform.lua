return {
  'stevearc/conform.nvim',
  event = "InsertEnter",
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      -- Use a sub-list to run only the first available formatter
      javascript = { { "prettier" } },
      typescript = { { "prettier" } },
      typescriptreact = { { "prettier" } },
      css = { { "prettier" } }
    },
  },
  n
}
