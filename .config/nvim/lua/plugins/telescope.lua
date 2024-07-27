return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      -- layout_strategy = 'dropdown',
      -- layout_config = {
      --   height = 0.9,
      --   width = 0.5,
      --   prompt_position = 'top',
      -- },
      -- sorting_strategy = "ascending"
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      }
    },
  }

}
