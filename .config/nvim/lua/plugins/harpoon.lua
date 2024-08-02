return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    { '<leader>a', function() require('harpoon'):list():add() end,                                    desc = "Harpoon: Add Buffer" },
    { '<leader>h', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc = "Harpoon: Toggle List" },
    { '<C-j>',     function() require('harpoon'):list():select(1) end,                                desc = "Harpoon: Buffer 1" },
    { '<C-k>',     function() require('harpoon'):list():select(2) end,                                desc = "Harpoon: Buffer 2" },
    { '<C-l>',     function() require('harpoon'):list():select(3) end,                                desc = "Harpoon: Buffer 3" },
    { '<C-h>',     function() require('harpoon'):list():select(4) end,                                desc = "Harpoon: Buffer 4" },
    { '<leader>k', function() require('harpoon'):list():select(5) end,                                desc = "Harpoon: Buffer 5" },
  },
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  }
}
