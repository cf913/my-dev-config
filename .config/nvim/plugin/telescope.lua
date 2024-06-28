local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<CR>',
  { desc = "Find Hidden Files" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Find Recent Files" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = "Find Quickfix" })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Find Diagnostics" })
vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = "Find Jumplist" })
vim.keymap.set('n', '<leader>F', builtin.live_grep, { desc = "Search All Files" })
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<LEADER>jd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>',
  { noremap = true, silent = true })
vim.keymap.set('n', '<LEADER>jv', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>',
  { noremap = true, silent = true })
vim.keymap.set('n', '<LEADER>b', '<cmd>NvimTreeToggle<CR>', {})
vim.keymap.set('n', '<LEADER>e', '<cmd>NvimTreeFocus<CR>', {})
