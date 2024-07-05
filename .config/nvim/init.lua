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
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      main = "ibl",
      opts = {
        indent = {
          char = "│",
        },
      }
    },
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    { "Bilal2453/luvit-meta",             lazy = true }, -- optional `vim.uv` typings
    -- { 'j-hui/fidget.nvim', opts = {}},
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
    { 'nvim-treesitter/nvim-treesitter' },
    { 'L3MON4D3/LuaSnip' },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {
          update_focused_file = {
            enable = true,
          },
          filters = {
            dotfiles = false,
            custom = { ".git" },
          },
        }
      end
    },
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
      -- use opts = {} for passing setup options
      -- this is equalent to setup({}) function
    },
    { 'prettier/vim-prettier' },
    {
      "karb94/neoscroll.nvim"
    },
    { 'petertriho/nvim-scrollbar' },
    { 'norcalli/nvim-colorizer.lua' },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    { 'lewis6991/gitsigns.nvim' },
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    {
      'numToStr/Comment.nvim',
      opts = {
        -- add any options here
      }
    },
    {
      "luckasRanarison/tailwind-tools.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      opts = {} -- your configuration
    },
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
    },

  }
})


require('colorizer').setup()

require('gitsigns').setup()


vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
