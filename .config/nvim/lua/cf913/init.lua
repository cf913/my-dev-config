require("cf913.remap")

vim.o.number = true         -- Enable line numbers
vim.o.relativenumber = true -- Enable relative line numbers
vim.o.tabstop = 2           -- Number of spaces a tab represents
vim.o.shiftwidth = 2        -- Number of spaces for each indentation
vim.o.expandtab = true      -- Convert tabs to spaces
vim.o.smartindent = true    -- Automatically indent new lines
vim.o.wrap = false          -- Disable line wrapping
vim.o.cursorline = true     -- Highlight the current line
vim.o.termguicolors = true  -- Enable 24-bit RGB colors
vim.o.conceallevel = 2
vim.o.cmdheight = 0

vim.o.splitbelow = true
vim.o.splitright = true

vim.opt.scrolloff = 8
-- vim.opt.mouse = ""

-- NEOVIDE ONLY CONFIG
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- Helper function for transparency formatting
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_animate_in_insert_mode = true
  -- not sure if i like smooth inserts or not. WIll have to test both.
  vim.api.nvim_set_keymap("n", "<D-=>",
    ":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  2.0)<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<D-->",
    ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>", { silent = true })
  -- vim.g.neovide_text_gamma = 0.8
  -- vim.g.neovide_text_contrast = 0.1
  vim.opt.linespace = 3

  vim.keymap.set('n', '<D-s>', vim.cmd.w)                                -- Save
  vim.keymap.set('v', '<D-c>', '"+y', { silent = true, noremap = true }) -- Copy
  vim.keymap.set('n', '<D-v>', '"+P')                                    -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P')                                    -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+')                                 -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli')                            -- Paste insert mode

  -- Allow clipboard copy paste in neovim
  vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })
end

vim.keymap.set({ 'n', 'i', 'v' }, '<A-up>', 'ddkP', { desc = 'Move line UP' })
vim.keymap.set({ 'n', 'i', 'v' }, '<A-down>', 'ddp', { desc = 'Move line DOWN' })

-- Syntax highlighting and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
