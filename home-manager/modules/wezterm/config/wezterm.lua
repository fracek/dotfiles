local wezterm = require("wezterm")

local config = {}

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("monospace")
config.default_cursor_style = "BlinkingUnderline"
config.window_background_opacity = 0.95

config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true

return config