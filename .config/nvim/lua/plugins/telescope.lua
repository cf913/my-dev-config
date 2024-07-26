return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  lazy = true,
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        layout_config = {
          height = 0.9,
          width = 0.9,
          preview_width = 0.5,
        },
      },
    })
  end
}
