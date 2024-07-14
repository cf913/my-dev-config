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
          { "diff" }
        },
        lualine_x = {
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
      sections = {
        lualine_a = {
          {
            'filename',
            file_status = true,     -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 1,               -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = '[+]',      -- Text to show when the file is modified.
              readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New]',     -- Text to show for newly created file before first write
            }
          }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
    }
  end,
}
