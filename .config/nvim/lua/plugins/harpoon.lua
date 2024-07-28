return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    { '<leader>a' },
    { '<leader>h' },
    { '<C-j>' },
    { '<C-k>' },
    { '<C-l>' },
    { '<C-p>' },
    { '<leader>k' },
  },
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  }
}
