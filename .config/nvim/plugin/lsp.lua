vim.opt.signcolumn = 'yes'

require("mason").setup({})
require("mason-lspconfig").setup({
  automatic_enable = true,
  ensure_installed = { "ts_ls", "emmet_language_server", "lua_ls" },
})
