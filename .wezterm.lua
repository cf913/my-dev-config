-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.front_end = "WebGpu"
config.max_fps = 120

-- For example, changing the color scheme:
config.colors = {
  foreground = "#CBE0F0",
  -- background = "#011423",
  -- background = "#000000",
  -- background = "#1A1B27", -- tokyonight
  background = "#191724", -- rose-pine
  cursor_bg = "#47FF9C",
  cursor_border = "#47FF9C",
  cursor_fg = "#011423",
  selection_bg = "#706b4e",
  selection_fg = "#f3d9c4",
  ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
  brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
  tab_bar = {
    background = "rgba(0,0,0,0)",
    active_tab = {
      -- The color of the background area for the tab
      bg_color = 'rgba(0,0,0,0)',
      fg_color = '#47FF9C',
    },
    inactive_tab = {
      -- The color of the background area for the tab
      bg_color = 'rgba(0,0,0,0)',
      fg_color = '#333333',
      italic = true
    }
  },
}

-- config.font = wezterm.font("MesloLGS Nerd Font Mono", { weight = 'Medium' })
-- config.freetype_load_flags = 'NO_HINTING'
config.font = wezterm.font('JetBrainsMono Nerd Font Propo')
config.font_size = 13
config.line_height = 1.2
config.cell_width = 0.94
-- config.freetype_render_target = 'Normal'
-- config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

config.window_padding = {
  left = 0,
  right = 0,
  top = 8,
  bottom = 0,
}


config.window_decorations = "RESIZE"
config.window_background_opacity = 0.90
config.macos_window_background_blur = 20

config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

-- and finally, return the configuration to wezterm
return config
