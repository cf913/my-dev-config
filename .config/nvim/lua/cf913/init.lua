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

local separator = vim.g.neovide and " │  " or " ┃  "
-- local separator = " │  "
vim.opt.statuscolumn =
    '%s%=%#LineNr4#%{(v:relnum >= 4)?v:relnum.\"' .. separator .. '\":\"\"}' ..
    '%#LineNr3#%{(v:relnum == 3)?v:relnum.\"' .. separator .. '\":\"\"}' ..
    '%#LineNr2#%{(v:relnum == 2)?v:relnum.\"' .. separator .. '\":\"\"}' ..
    '%#LineNr1#%{(v:relnum == 1)?v:relnum.\"' .. separator .. '\":\"\"}' ..
    '%#LineNr0#%{(v:relnum == 0)?v:lnum.\"' .. separator .. '\":\"\"}'

vim.o.splitbelow = true
vim.o.splitright = true

vim.opt.scrolloff = 6

-- NEOVIDE ONLY CONFIG
if vim.g.neovide then
  local default_path = vim.fn.expand("~/")
  vim.api.nvim_set_current_dir(default_path)
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_text_gamma = 0.01
  vim.g.neovide_text_contrast = 0.01

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
  vim.opt.linespace = 7

  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  -- -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * (vim.g.neovide_transparency_point or 0.8)))
  end
  -- Set transparency and background color (title bar color)
  vim.g.neovide_transparency = 0.3
  vim.g.neovide_transparency_point = 0.9
  -- Add keybinds to change transparency
  local change_transparency = function(delta)
    vim.g.neovide_transparency_point = vim.g.neovide_transparency_point + delta
    vim.g.neovide_background_color = vim.g.neovide_background_color_base .. alpha()
  end
  vim.keymap.set({ "n", "v", "o" }, "<D-]>", function()
    if vim.g.neovide_transparency_point <= 0.9 then
      change_transparency(0.1)
    end
  end)
  vim.keymap.set({ "n", "v", "o" }, "<D-[>", function()
    if vim.g.neovide_transparency_point >= 0.1 then
      change_transparency(-0.1)
    end
  end)
  -- vim.g.neovide_transparency = 0.3
  -- vim.g.transparency = 0.8

  vim.g.neovide_window_blurred = true

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
