local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.font = "monospace 8"

theme.icon_theme = "Papirus"

-- catppuccin mocha
local catppuccin = {
    text = "#cdd6f4",
    subtext = "#a6adc8",
    base = "#1e1e2e",
    lavender = "#b4befe",
    rosewater = "#f5e0dc",
    sapphire = "#74c7ec",
    flamingo = "#f2cdcd",
    maroon = "#eba0ac",
    mauve = "#cba6f7",
    pink = "#f5c2e7",
    blue = "#89b4fa",
    red = "#f38ba8",
    green = "#a6e3a1",
    yellow = "#f9e2af",
    overlay = "#6c7086",
}

local colors = {
    fg = catppuccin.text,
    bg = catppuccin.base,
    transparent = "#00000000",
}

theme.bg_normal = colors.bg
theme.bg_focus = catppuccin.flamingo
theme.fg_normal = colors.fg
theme.fg_focus = colors.fg
theme.fg_urgent = theme.fg_normal
theme.fg_minimize = theme.fg_normal

theme.useless_gap = dpi(32)
theme.border_width = dpi(3)
theme.border_normal = theme.bg_normal
theme.border_focus = theme.bg_focus
theme.border_marked = theme.border_normal

theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_bg_focus = theme.bg_normal

theme.taglist_bg_empty = catppuccin.maroon
theme.taglist_bg_normal = catppuccin.maroon
theme.taglist_fg_normal = catppuccin.overlay
theme.taglist_bg_focus = catppuccin.flamingo
theme.taglist_fg_focus = catppuccin.flamingo
theme.taglist_bg_occupied = catppuccin.maroon
theme.taglist_fg_occupied = catppuccin.subtext


theme.bar_indicator_clock = catppuccin.sapphire
theme.bar_indicator_systray = catppuccin.sapphire
theme.bar_indicator_fcitx_inactive = catppuccin.flamingo
theme.bar_indicator_fcitx_active = catppuccin.red

theme.bg_systray = theme.bar_indicator_systray

theme.bar_indicator_cpu_low = catppuccin.green
theme.bar_indicator_cpu_medium = catppuccin.yellow
theme.bar_indicator_cpu_high = catppuccin.red

theme.bar_indicator_bat_charging_full = catppuccin.blue
theme.bar_indicator_bat_charging = catppuccin.lavender
theme.bar_indicator_bat_full = catppuccin.green
theme.bar_indicator_bat_medium = catppuccin.yellow
theme.bar_indicator_bat_low = catppuccin.red

theme.bar_indicator_volume_on = catppuccin.green
theme.bar_indicator_volume_off = catppuccin.sapphire

theme.menu_height = dpi(12)
theme.menu_width = dpi(200)

local dir = os.getenv('HOME') .. "/.config/awesome/themes/synth/"

theme.menu_submenu_icon = dir .. "/icons/submenu.svg"
theme.power_icon = dir .. "/icons/power.svg"

theme.tasklist_disable_icon = true
theme.tasklist_bg_focus = catppuccin.lavender
theme.tasklist_bg_normal = catppuccin.subtext
theme.tasklist_fg_normal = catppuccin.subtext
theme.tasklist_fg_focus = catppuccin.text

theme.wibar_ontop = true
theme.wibar_type = "dock"
theme.wibar_bg = colors.transparent
theme.wibar_fg = catppuccin.base

-- Display the taglist squares
theme.taglist_disable_icon = true

-- Notifications
theme.notification_width = dpi(200)
theme.notification_height = dpi(50)
theme.notification_icon_size = dpi(50)
theme.notification_margin = dpi(10)

local wallpaper_path = dir .. "/wallpapers/synth.jpg"
theme.wallpaper = function(s)
    gears.wallpaper.maximized(wallpaper_path, s)
end

return theme
