return {
  'tris203/precognition.nvim',
  keys = {
    { "<leader>Tp", function() require('precognition').toggle() end, { desc = 'Pregognition: Toggle' } }
  },
  opts = {}
}
