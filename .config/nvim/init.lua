require("cf913")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      style = 'night',
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.bg_statusline = colors
            .none -- To check if its working try something like "#ff00ff" instead of colors.none
      end,
    },
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
  { "rose-pine/neovim",               name = "rose-pine" },
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
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' }
  -- },
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {} -- your configuration
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        color = {
          suggestion_color = "#ffffff",
        },
        ignore_filtetypes = { "git", "node_modules", "dist", "build", "target", "vendor", '.env', '.env.local' }
      })
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    "folke/trouble.nvim",
    opts = {
      focus = true,
      modes = {
        nsymbols = {
          mode = "symbols",
          win = {
            size = 0.3,
          }
        },
        ndiagnostics = {
          mode = "diagnostics",
          win = {
            position = "bottom",
            size = 0.3,
          },
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.5,
          },
        },
      },
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble ndiagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      -- {
      --   "<leader>xx",
      --   "<cmd>Trouble diagnostics toggle<cr>",
      --   desc = "Diagnostics (Trouble)",
      -- },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble nsymbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
})




require('colorizer').setup()

require('gitsigns').setup()


vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
