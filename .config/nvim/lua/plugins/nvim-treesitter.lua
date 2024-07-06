return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = "all",     -- or specify languages {"python", "javascript"}
      highlight = {
        enable = true,
      },
    })
  end
}
