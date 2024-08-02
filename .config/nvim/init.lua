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
      "m4xshen/hardtime.nvim",
      dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
      event = "InsertEnter",
      keys = {
        { "<leader>Th", ":Hardtime toggle<cr>", desc = "Toggle Hardtime" },
      },
      opts = {
        max_count = 10,
      },
    },
    { "Bilal2453/luvit-meta",             lazy = true }, -- optional `vim.uv` typings
    { "VonHeikemen/lsp-zero.nvim",        branch = "v3.x" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      opts = function()
        local cmp = require("cmp")
        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            end,
          },
          completion = { completeopt = "menu,menuone,noinsert" },
          window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            -- Ctrl + space triggers completion menu
            ["<C-Space>"] = cmp.mapping.complete(),
            -- ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<C-n>"] = cmp.mapping(function()
              if cmp.visible() then
                cmp.select_next_item({ behavior = "insert" })
              else
                cmp.complete()
              end
            end),
          }),
          sources = cmp.config.sources({
            {
              name = "lazydev",
              -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
              group_index = 0,
            },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "luasnip" }, -- For luasnip users.
            -- { name = "orgmode" },
          }, {
            { name = "buffer" },
            { name = "path" },
          }),
        })
      end,
    },
    {
      "hrsh7th/cmp-nvim-lsp",
    },
    { "L3MON4D3/LuaSnip" },
    {
      "lewis6991/gitsigns.nvim",
      event = "InsertEnter",
      opts = {},
    },
  },
})

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}
