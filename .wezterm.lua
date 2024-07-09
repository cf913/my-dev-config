-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.front_end = "WebGpu"
config.max_fps = 240

-- For example, changing the color scheme:
config.colors = {
  foreground = "#CBE0F0",
  background = "#011423",
  -- background = "#000000",
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

config.font = wezterm.font("MesloLGS Nerd Font Mono", { weight = 'Medium' })
-- config.font = wezterm.font('FiraCode Nerd Font', { weight = 'Regular' })
config.font_size = 14
-- config.freetype_load_target = 'Normal'
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
  top = 10,
  bottom = 0,
}


config.window_decorations = "RESIZE"
config.window_background_opacity = 0.55
config.macos_window_background_blur = 30

-- and finally, return the configuration to wezterm
return config
