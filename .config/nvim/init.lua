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
    -- {
    --   'numToStr/Navigator.nvim',
    --   config = function()
    --     require('Navigator').setup()
    --   end
    -- },
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
      config = function()
        local wilder = require('wilder')
        wilder.setup({
          modes = { '/', '?', ':' },
          pipeline = {
            wilder.cmdline_pipeline({
              fuzzy = 2,
            }),
          }
        })
        wilder.set_option('renderer',
          wilder.popupmenu_renderer({
            highlighter = wilder.basic_highlighter(),
            highlights = {
              border = 'TelescopeBorder',
              accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#5FF1FF' } }),
            },
            left = { ' ', wilder.popupmenu_devicons() },
            right = { ' ', wilder.popupmenu_scrollbar() },
            border = 'rounded',
            pumblend = 0
          })
        )
      end
    },
    { "Bilal2453/luvit-meta",             lazy = true }, -- optional `vim.uv` typings
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
      "karb94/neoscroll.nvim",
      config = function()
        local neoscroll = require('neoscroll')
        neoscroll.setup({
          -- Default easing function used in any animation where
          -- the `easing` argument has not been explicitly supplied
          easing = "quadratic"
        })
        local keymap = {
          ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 150 }) end,
          ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 150 }) end,
          ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 250 }) end,
          ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 250 }) end,
          ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
          ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
          ["zt"]    = function() neoscroll.zt({ half_win_duration = 150 }) end,
          ["zz"]    = function() neoscroll.zz({ half_win_duration = 150 }) end,
          ["zb"]    = function() neoscroll.zb({ half_win_duration = 150 }) end,
        }
        local modes = { 'n', 'v', 'x' }
        for key, func in pairs(keymap) do
          vim.keymap.set(modes, key, func)
        end
      end,
      -- opts = {
      --   mappings = { -- Keys to be mapped to their corresponding default scrolling animation
      --     '<C-u>', '<C-d>',
      --     '<C-b>', '<C-f>',
      --     '<C-y>', '<C-e>',
      --     'zt', 'zz', 'zb',
      --   },
      --   hide_cursor = false,         -- Hide cursor while scrolling
      --   stop_eof = true,             -- Stop at <EOF> when scrolling downwards
      --   respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      --   cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      --   easing = 'quadratic',        -- Default easing function
      --   pre_hook = nil,              -- Function to run before the scrolling animation starts
      --   post_hook = nil,             -- Function to run after the scrolling animation ends
      --   performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      -- }
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
  }
})

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
-- local navigator = require('Navigator')
--
-- vim.keymap.set({ 'n', 't' }, '<A-h>', navigator.down, { desc = 'TMUX: down pane' })
-- vim.keymap.set({ 'n', 't' }, '<A-l>', navigator.right, { desc = 'TMUX: right pane' })
-- vim.keymap.set({ 'n', 't' }, '<A-k>', navigator.up, { desc = 'TMUX: up pane' })
-- vim.keymap.set({ 'n', 't' }, '<A-j>', navigator.down, { desc = 'TMUX: down pane' })
-- vim.keymap.set({ 'n', 't' }, '<C-p>', navigator.previous, { desc = 'TMUX: previous pane' })
