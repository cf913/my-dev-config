local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fp', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<CR>',
  { desc = "Find Hidden Files" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Find Recent Files" })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Find Keymaps" })
vim.keymap.set('n', '<leader>fb', function() builtin.buffers({ sort_mru = true, ignore_current_buffer = true }) end,
  { desc = "Find Buffers", })
-- vim.keymap.set({ 'n', 'v' }, '<leader>fb',
--   function()
--     require("neo-tree.command").execute({ source = "buffers", reveal = true, position = 'float' })
--   end,
--   { desc = "Buffer Explorer" })
vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = "Find Jumplist" })
vim.keymap.set('n', '<leader>fa', builtin.live_grep, { desc = "Search All Files" })

vim.keymap.set('n', '<leader>fo',
  '<cmd>Oil<CR>',
  { desc = "Open Oil" })

vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<LEADER>jd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>',
  { noremap = true, silent = true })
vim.keymap.set('n', '<LEADER>jv', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>',
  { noremap = true, silent = true })


-- vim.keymap.set('n', '<LEADER>eb', '<cmd>NvimTreeToggle<CR>', {})
-- vim.keymap.set('n', '<LEADER>ee', '<cmd>NvimTreeFocus<CR>', {})
-- vim.keymap.set('n', '<LEADER>E', '<cmd>NvimTreeFocus<CR>', {})
-- vim.keymap.set("n", '<leader>fe', function()
--     require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
--   end,
--   { desc = "Explorer NeoTree (cwd)" })
