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
      "nvim-pack/nvim-spectre",
      build = false,
      cmd = "Spectre",
      opts = { open_cmd = "noswapfile vnew" },
      -- stylua: ignore
      keys = {
        { "<leader>sr", function() require("spectre").toggle() end, desc = "Replace in Files (Spectre)" },
      },
    },
    {
      'gelguy/wilder.nvim',
      opts = {
        modes = { ':', '/', '?' }
      }
    },
    -- {
    --   "vhyrro/luarocks.nvim",
    --   priority = 1000,
    --   config = true,
    -- },
    -- {
    --   "nvim-neorg/neorg",
    --   dependencies = { "luarocks.nvim" },
    --   version = "*",
    --   config = function()
    --     require("neorg").setup {
    --       load = {
    --         ["core.defaults"] = {},
    --         ["core.concealer"] = {},
    --         ["core.dirman"] = {
    --           config = {
    --             workspaces = {
    --               notes = "~/norg/notes",
    --               journal = "~/norg/journal",
    --             },
    --             default_workspace = "notes",
    --           },
    --         },
    --       },
    --     }
    --
    --     vim.wo.foldlevel = 99
    --     vim.wo.conceallevel = 2
    --   end,
    -- },
    { "Bilal2453/luvit-meta",             azy = true }, -- optional `vim.uv` typings
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
    { 'L3MON4D3/LuaSnip' },
    { 'prettier/vim-prettier' },
    {
      "karb94/neoscroll.nvim"
    },
    {
      'norcalli/nvim-colorizer.lua',
      opts = {}
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
