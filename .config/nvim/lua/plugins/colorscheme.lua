local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.neovide_transparency_point or 0.8))
end
return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        style = 'night',
        styles = {
          sidebars = "transparent",
          floats = "transparent",
          statusline = "transparent",
        },
        on_colors = function(colors)
          colors.bg_statusline = colors
              .none -- To check if its working try something like "#ff00ff" instead of colors.none
        end,
        on_highlights = function(highlights)
          highlights.TreesitterContext = { bg = "NONE" }
          highlights.TreesitterContextLineNumber = { bg = "NONE" }
          highlights.LineNr4 = { fg = "#3B4261" }
          highlights.LineNr3 = { fg = "#4d71a0" }
          highlights.LineNr2 = { fg = "#6fc1cf" }
          highlights.LineNr1 = { fg = "#aff1ff" }
          highlights.LineNr0 = { fg = "#FF9D65", bold = true }
        end,
      })
      if vim.g.neovide then
        -- Set transparency and background color (title bar color)
        vim.g.neovide_background_color_base = "#2a2839"
        vim.g.neovide_background_color = vim.g.neovide_background_color_base .. alpha()
        vim.cmd.colorscheme('tokyonight')
      else
        -- vim.cmd.colorscheme('tokyonight') -- setting
      end
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
      require("rose-pine").setup({
        variant = "auto",      -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = false,

        enable = {
          terminal = false,
          legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
          migrations = true,         -- Handle deprecated options automatically
        },

        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",

        },

        highlight_groups = {
          Number = { fg = "#5BC1A2" },
          LineNr4 = { fg = "#3B4261" },
          LineNr3 = { fg = "#445464" },
          LineNr2 = { fg = "#5D8E97" },
          LineNr1 = { fg = "#7DAEB9" },
          LineNr0 = { fg = "#bDeEf9", bold = true }
        },
      })

      if vim.g.neovide then
        -- Set transparency and background color (title bar color)
        -- vim.g.neovide_background_color_base = "#262231"
        vim.g.neovide_background_color = vim.g.neovide_background_color_base .. alpha()
        -- vim.cmd("colorscheme rose-pine")
      else
        vim.cmd("colorscheme rose-pine") -- setting
      end
    end
  }
}
