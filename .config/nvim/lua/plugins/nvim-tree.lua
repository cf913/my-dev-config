return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      filters             = {
        dotfiles = false,
        custom = { ".git" },
      },
      actions             = {
        open_file = { quit_on_open = true },
      },
      renderer            = {
        indent_markers = { enable = true }
      },
      respect_buf_cwd     = true,
      update_cwd          = true,
      update_focused_file = { enable = true },
      view                = {
        adaptive_size = true,
      }
    }
  end
}
