require("cf913")

vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "       -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
  spec = {
    { import = "plugins" },
    {
      'numToStr/Navigator.nvim',
      config = function()
        require('Navigator').setup()
      end
    },
    {
      'stevearc/conform.nvim',
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
    },
    {
      "nvim-pack/nvim-spectre",
      build = false,
      cmd = "Spectre",
      opts = { open_cmd = "noswapfile vnew" },
      -- stylua: ignore
      keys = {
        { "<leader>sr", function() require("spectre").toggle() end,                                 desc = "Replace in Files (Spectre)" },
        { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end,      desc = "Replace Selected Word (Spectre)" },
        { "<leader>sf", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Replace in Current File (Spectre)" },
      },
    },
    {
      'gelguy/wilder.nvim',
      opts = {
        modes = { ':', '/', '?' }
      }
    },
    { "Bilal2453/luvit-meta",             azy = true }, -- optional `vim.uv` typings
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    {
      'hrsh7th/nvim-cmp',
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        })
      end,
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    -- { 'prettier/vim-prettier' },
    {
      "karb94/neoscroll.nvim"
    },
    {
      'NvChad/nvim-colorizer.lua',
      opts = {
        filetypes = { "*" },
        user_default_options = {
          RGB = true,          -- #RGB hex codes
          RRGGBB = true,       -- #RRGGBB hex codes
          names = true,        -- "Name" codes like Blue or blue
          RRGGBBAA = true,     -- #RRGGBBAA hex codes
          AARRGGBB = false,    -- 0xAARRGGBB hex codes
          rgb_fn = false,      -- CSS rgb() and rgba() functions
          hsl_fn = false,      -- CSS hsl() and hsla() functions
          css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = false,      -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = "background", -- Set the display mode.
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          tailwind = true,                                 -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
          virtualtext = "■",
          -- update color values even if buffer is not focused
          -- example use: cmp_menu, cmp_docs
          always_update = false
        },
        -- all the sub-options of filetypes apply to buftypes
        buftypes = {},
      },
    },
    {
      'lewis6991/gitsigns.nvim',
      opts = {}
    },
    {
      'numToStr/Comment.nvim',
      opts = {}
    },
  }
})

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
local navigator = require('Navigator')

vim.keymap.set({ 'n', 't' }, '<C-h>', navigator.down, { desc = 'TMUX: down pane' })
vim.keymap.set({ 'n', 't' }, '<C-l>', navigator.right, { desc = 'TMUX: right pane' })
vim.keymap.set({ 'n', 't' }, '<C-k>', navigator.up, { desc = 'TMUX: up pane' })
vim.keymap.set({ 'n', 't' }, '<C-j>', navigator.down, { desc = 'TMUX: down pane' })
-- vim.keymap.set({ 'n', 't' }, '<C-p>', navigator.previous, { desc = 'TMUX: previous pane' })
