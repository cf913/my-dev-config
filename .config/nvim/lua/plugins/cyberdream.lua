return {
  "scottmckendry/cyberdream.nvim",
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      -- Enable transparent background
      transparent = true,

      -- Enable italics comments
      italic_comments = true,

      -- Replace all fillchars with ' ' for the ultimate clean look
      hide_fillchars = false,

      -- Modern borderless telescope theme
      borderless_pickers = true,

      -- Set terminal colors used in `:terminal`
      terminal_colors = true,

      options = {
        theme = 'default'
      },

      highlights = {
        -- Highlight groups to override, adding new groups is also possible
        -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

        -- Example:
        -- Comment = { fg = "#696969", bg = "NONE", italic = true },
        LineNr4 = { fg = "#3B4261" },
        LineNr3 = { fg = "#4d71a0" },
        LineNr2 = { fg = "#6fc1cf" },
        LineNr1 = { fg = "#eeffee" },
        LineNr0 = { fg = "#FFFFFF", bg = "NONE", bold = true }

        -- Complete list can be found in `lua/cyberdream/theme.lua`
      },

      -- Disable or enable colorscheme extensions
      extensions = {
        telescope = true,
        notify = true,
        mini = true,
      },
    })
  end
}
