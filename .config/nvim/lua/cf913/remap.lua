vim.g.mapleader = " "
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.keymap.set("n", "<leader>1", vim.cmd.tabfirst, { desc = "Tab: First" })
vim.keymap.set("n", "<leader>2", "2gt", { desc = "Tab: 2nd" })
vim.keymap.set("n", "<leader>3", "3gt", { desc = "Tab: 3nd" })
vim.keymap.set("n", "<leader>0", vim.cmd.tablast, { desc = "Tab: Last" })

-- save this
vim.keymap.set("n", "<leader>w", vim.cmd.w, { desc = "Write Buffer" })
vim.keymap.set("n", "<leader>qq", ":bd<cr>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>qa", ":wa<CR>:qa<CR>", { desc = "Save and quit NVIM" })

-- vim.keymap.set("n", "<C-n>", vim.cmd.bn, { desc = "Buffer next" })
-- vim.keymap.set("n", "<C-p>", vim.cmd.bp, { desc = "Buffer previous" })

-- keymap to copy the current selection to the system clipboard_tool
vim.keymap.set({ "n", "v" }, "<leader>C", "\"*y", { desc = "Clipboard: COPY" })
vim.keymap.set({ "n", "v" }, "<leader>V", "\"*p", { desc = "Clipboard: PASTE" })

vim.keymap.set("n", "-", ":split<CR>", { desc = "Window: Split --" })
vim.keymap.set("n", "|", ":vsplit<CR>", { desc = "Window: Split |" })

-- SET
-- vim.keymap.set("n", "<leader>S", ":set ic!<CR>", { desc = "Toggle Search SmartCase" })
vim.keymap.set("n", "<leader>sc2", ":set conceallevel=2<CR>", { desc = "Set conceallevel 2" })
vim.keymap.set("n", "<leader>sc0", ":set conceallevel=0<CR>", { desc = "Set conceallevel 2" })

vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float(nil, {scope=\"cursor\"})<CR>",
  { desc = "Diagnostic Over Cursor" })


vim.keymap.set({ "n", "v" }, "<leader>Ts", ":SupermavenToggle<CR>", { desc = "Toggle Supermaven" })
vim.keymap.set({ "n", "v" }, "<leader>Ti", ":IBLToggle<CR>", { desc = "Toggle Indent" })

vim.keymap.set({ "n", "v" }, "<leader>tn", ":tabn<CR>", { desc = "Tab: Next" })
vim.keymap.set({ "n", "v" }, "<leader>tp", ":tabp<CR>", { desc = "Tab: Previous" })
vim.keymap.set({ "n", "v" }, "<leader>to", ":tab new<CR>", { desc = "Tab: Open" })
vim.keymap.set({ "n", "v" }, "<leader>tq", ":tabc<CR>", { desc = "Tab: Open" })




local auto_import = function()
  local params = vim.lsp.util.make_range_params()
  params.context = {
    only = { "source.addMissingImports.ts" },
  }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.kind == "source.addMissingImports.ts" then
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.addMissingImports.ts" },
          },
        })
      end
    end
  end
end

local organize_imports = function()
  local params = vim.lsp.util.make_range_params()
  params.context = {
    only = { "source.removeUnused.ts" },
  }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.kind == "source.removeUnused.ts" then
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.removeUnused.ts" },
          },
        })
      end
    end
  end
  vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } })
end

vim.keymap.set("n", "<leader>ii", auto_import, { desc = "Import: Add Missing" })
vim.keymap.set("n", "<leader>io", organize_imports, { desc = "Import: Organize" })

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "Context: Previous" })
