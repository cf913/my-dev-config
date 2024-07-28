return {
  'tris203/precognition.nvim',
  keys = {
    { "<leader>TP", desc = 'Start Precognition' },
    { "<leader>Tp", function() require('precognition').toggle() end, desc = 'Toggle Precognition' }
  },
  opts = {
    startVisible = true,
  }
}
