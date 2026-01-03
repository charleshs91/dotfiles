-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This holds the configuration.
local config = wezterm.config_builder()

-- Performance
config.max_fps = 120
config.prefer_egl = true

-- Font
-- config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 14
config.line_height = 1.4

-- Color
config.color_scheme = "Gruvbox dark, pale (base16)"
-- config.color_scheme = "Tomorrow (dark) (terminal.sexy)"

-- Appearance
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.initial_cols = 197
config.initial_rows = 48
config.window_decorations = "RESIZE"
config.window_padding = { top = 0, left = 0, right = 0, bottom = 0 }
config.window_frame = {
  font = wezterm.font({ family = "Futura" }),
}
config.inactive_pane_hsb = {
  saturation = 0.7,
  brightness = 0.3,
}

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Load custom modules
require("background").setup(config)
require("keymaps").setup(config)

-- and finally, return the configuration to wezterm
return config
