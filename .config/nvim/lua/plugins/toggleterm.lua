return {
  'akinsho/toggleterm.nvim',
  version = "*",
  keys = {
    { '<leader>`', desc = "Lazygit: Open" }
  },
  opts = {
    open_mapping = [[<leader>`]],
    insert_mappings = false,
    direction = 'float'
  }
}
