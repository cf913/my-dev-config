vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

require("lazy").setup({
  spec = {
    { import = "plugins" },
    -- { "VonHeikemen/lsp-zero.nvim",     branch = "v4.x" },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        automatic_enable = true,
        ensure_installed = {
          "lua_ls", "emmet_language_server", "ts_ls", "vimls"
        }
      },
      dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        { "neovim/nvim-lspconfig" },
      },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    {
      "FabijanZulj/blame.nvim",
      lazy = false,
      config = function()
        require('blame').setup {
          mappings = {
            commit_info = "i",
            stack_push = "<TAB>",
            stack_pop = "<BS>",
            show_commit = "<CR>",
            close = { "q" },
          }
        }
      end,
    },
    {
      'razak17/tailwind-fold.nvim',
      opts = {
        ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'php', 'blade' },
      },
      keys = { { '<leader>TT', desc = 'Start TailwindFold' } },
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
    {
      'saghen/blink.cmp',
      -- optional: provides snippets for the snippet source
      --   dependencies = { 'rafamadriz/friendly-snippets' },
      --
      --     -- use a release tag to download pre-built binaries
      version = '1.*',
      -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
      -- build = 'cargo build --release',
      -- If you use nix, you can build from source using latest nightly rust with:
      -- build = 'nix run .#build-plugin',

      --- @module 'blink.cmp'
      --- @type blink.cmp.Config
      opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'enter' },

        appearance = {
          -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = 'mono'
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = true } },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
    },
    -- {
    --   "sphamba/smear-cursor.nvim",
    --   enabled = not vim.g.neovide,
    --   opts = {
    --     cursor_color = "#47FF9C",
    --     legacy_computing_symbols_support = true,
    --     -- stiffness = 0.8,
    --     -- trailing_stiffness = 0.5,
    --     -- distance_stop_animationg = 0.5
    --   },
    -- }
  },
})

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}
