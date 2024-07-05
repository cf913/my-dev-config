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
      sections = {
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
            "datetime",
            style = "  %X",
          },
        },
      },

      extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
    }
  end,
}
