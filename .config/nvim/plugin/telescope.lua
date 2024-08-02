local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fp',
  function() builtin.find_files(require('telescope.themes').get_dropdown { previewer = false }) end,
  { desc = "Find Files" })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,-u<CR>',
  { desc = "Find Hidden Files" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set('n', '<leader>fc',
  function() builtin.colorscheme(require('telescope.themes').get_dropdown({ previewer = false })) end,
  { desc = "Find Colorscheme" })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Find Recent Files" })
vim.keymap.set('n', '<leader>fR', builtin.lsp_references, { desc = "Find LSP References" })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Find Keymaps" })
vim.keymap.set('n', '<leader>fb', function() builtin.buffers({ sort_mru = true, ignore_current_buffer = true }) end,
  { desc = "Find Buffers", })
vim.keymap.set({ 'n', 'v' }, '<leader><leader>',
  function()
    require("neo-tree.command").execute({ source = "buffers", reveal = true, position = 'float' })
  end,
  { desc = "Buffer Explorer" })
vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = "Find Jumplist" })
vim.keymap.set('n', '<leader>fa', builtin.live_grep, { desc = "Search All Files" })

vim.keymap.set('n', '<LEADER>jd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>',
  { noremap = true, silent = true, desc = 'Definition' })
vim.keymap.set('n', '<LEADER>jv', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>',
  { noremap = true, silent = true, desc = 'Definition Split' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    -- winblend = 100,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
