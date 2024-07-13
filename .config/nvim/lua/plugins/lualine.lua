return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = function()
    local utils = require("core.utils")

    return {
      options = {
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
        theme = "cyberdream",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      tabline = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = "" } },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 "
            },
          },
          { "filetype", icon_only = true,                 separator = "", padding = { left = 1, right = 0 } },
          { "filename", padding = { left = 1, right = 0 } },
          {
            function()
              local buffer_count = require("core.utils").get_buffer_count()

              return "+" .. buffer_count - 1 .. " "
            end,
            cond = function()
              return require("core.utils").get_buffer_count() > 1
            end,
            color = utils.get_hlgroup("Operator", nil),
            padding = { left = 0, right = 1 },
          },
        },
        lualine_x = {
          { "diff" },
        },
        lualine_y = {
          {
            "progress",
          },
          {
            "location",
            color = utils.get_hlgroup("Boolean"),
          },
        },
        lualine_z = {
          {
            'tabs',
            tab_max_length = 40,            -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
            max_length = vim.o.columns / 3, -- Maximum width of tabs component.
            mode = 2,                       -- 0: Shows tab_nr
            use_mode_colors = true,
          }
        },
      },
      sections = {},
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
    }
  end,
}
