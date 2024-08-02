-- LSP
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
  lsp_zero.buffer_autoformat()
end)

local lspconfig = require("lspconfig")

local check_if_server_is_active = function(name, bufnr)
  local active_clients = vim.lsp.get_clients()
  for _, client in pairs(active_clients) do
    if client.name == name then
      return vim.lsp.buf_is_attached(bufnr, client.id), client
    end
  end
  return false
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name == "tsserver" then
      local is_denols_active = check_if_server_is_active("denols", bufnr)
      if is_denols_active then
        vim.lsp.buf_detach_client(bufnr, args.data.client_id)
      end
    elseif client.name == "denols" then
      local is_tsserver_active, active_client = check_if_server_is_active("tsserver", bufnr)
      if is_tsserver_active then
        vim.lsp.buf_detach_client(bufnr, active_client.id)
      end
    end
  end,
})

require("mason").setup({})
require("mason-lspconfig").setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { "denols", "tsserver", "emmet_language_server", "lua_ls" },
  handlers = {
    function(server_name)
      lspconfig[server_name].setup({})
    end,
    ["tsserver"] = function()
      lspconfig["tsserver"].setup({
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
        on_attach = function(client, bufnr)
          local is_denols_active = check_if_server_is_active("denols", bufnr)
          if is_denols_active then
            vim.lsp.buf_detach_client(bufnr, client.id)
          end
        end,
      })
    end,
    ["denols"] = function()
      lspconfig["denols"].setup({
        root_dir = lspconfig.util.root_pattern("deno.json"),
        on_attach = function(_, bufnr)
          local is_tsserver_active, active_client = check_if_server_is_active("tsserver", bufnr)
          if is_tsserver_active then
            vim.lsp.buf_detach_client(bufnr, active_client.id)
          end
        end,
      })
    end,
  },
})

-- local cmp = require("cmp")
-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
--
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
--     end,
--   },
--   window = {
--     completion = cmp.config.window.bordered(),
--     documentation = cmp.config.window.bordered(),
--   },
--   mapping = cmp.mapping.preset.insert({
--     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     -- Ctrl + space triggers completion menu
--     ['<C-Space>'] = cmp.mapping.complete(),
--     -- ["<C-e>"] = cmp.mapping.abort(),
--     ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--     ['<C-n>'] = cmp.mapping(function()
--       if cmp.visible() then
--         cmp.select_next_item({ behavior = 'insert' })
--       else
--         cmp.complete()
--       end
--     end),
--   }),
--   sources = cmp.config.sources({
--     { name = "nvim_lsp" },
--     { name = "nvim_lua" },
--     { name = "luasnip" }, -- For luasnip users.
--     -- { name = "orgmode" },
--   }, {
--     { name = "buffer" },
--     { name = "path" },
--   }),
-- })

-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = "path" },
--   }, {
--     { name = "cmdline" },
--   }),
-- })

-- require("typescript-tools").setup({
--   single_file_support = false,
--   root_dir = lspconfig.util.root_pattern('package.json', 'bu.js', 'tsconfig.json', '.git'),
-- })
-- vim.keymap.set("n", "<leader>i", ":TSToolsAddMissingImports<CR>", {})
-- vim.keymap.set("n", "<leader>si", ":TSToolsOrganizeImports<CR>", {})
--

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("ts_fix_imports", { clear = true }),
--   desc = "Add missing imp worts and remove unused imports for TS",
--   pattern = { "*.ts", "*.tsx" },
--   callback = function()
--     local params = vim.lsp.util.make_range_params()
--     params.context = {
--       only = { "source.addMissingImports.ts", "source.removeUnused.ts" },
--     }
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
--     for _, res in pairs(result or {}) do
--       for _, r in pairs(res.result or {}) do
--         if r.kind == "source.addMissingImports.ts" then
--           vim.lsp.buf.code_action({
--             apply = true,
--             context = {
--               only = { "source.addMissingImports.ts" },
--             },
--           })
--           vim.cmd("write")
--         else
--           if r.kind == "source.removeUnused.ts" then
--             vim.lsp.buf.code_action({
--               apply = true,
--               context = {
--                 only = { "source.removeUnused.ts" },
--               },
--             })
--             vim.cmd("write")
--           end
--         end
--       end
--     end
--   end,
-- })
