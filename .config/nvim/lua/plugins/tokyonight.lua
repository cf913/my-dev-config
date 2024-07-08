return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      -- transparent = true,
      style = 'night',
      styles = {
        -- sidebars = "transparent",
        -- floats = "transparent",
        -- statusline = "transparent",
      },
      on_colors = function(colors)
        colors.bg_statusline = colors
            .none -- To check if its working try something like "#ff00ff" instead of colors.none
      end,
      on_highlights = function(highlights)
        highlights.TreesitterContext = { bg = "NONE" }
        highlights.TreesitterContextLineNumber = { bg = "NONE" }
      end,
    })
    vim.cmd.colorscheme('tokyonight')
  end,
}
