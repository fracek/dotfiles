local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.font = "monospace 8"

theme.icon_theme = "Papirus"

local solarized = {
    base03 = "#000338",
    base02 = "#160741",
    base01 = "#586174",
    base00 = "#646c82",
    base0 = "#838d95",
    base1 = "#aab1b5",
    base2 = "#e2e4f3",
    base3 = "#fefeff",

    yellow = "#f7c845",
    orange = "#f78945",
    red = "#f74566",
    magenta = "#d445f7",
    violet = "#9b45f7",
    blue = "#4592f7",
    cyan = "#59c0f8",
    green = "#74f745"
}

local colors = {
    fg = solarized.base01,
    bg = solarized.base3,
}

theme.bg_normal = colors.bg
theme.bg_focus = solarized.base03
theme.bg_urgent = theme.magenta
theme.bg_minimize = theme.bg_normal

theme.fg_normal = colors.fg
theme.fg_focus = colors.fg
theme.fg_urgent = theme.fg_normal
theme.fg_minimize = theme.fg_normal

theme.useless_gap = dpi(32)
theme.border_width = dpi(4)
theme.border_normal = theme.bg_normal
theme.border_focus = theme.bg_focus
theme.border_marked = theme.border_normal

theme.taglist_bg_focus = solarized.magenta
theme.taglist_fg_focus = solarized.magenta
theme.taglist_bg_occupied = solarized.cyan
theme.taglist_fg_occupied = solarized.cyan

theme.bg_systray = solarized.base03

theme.bar_indicator_clock = solarized.cyan
theme.bar_indicator_systray = solarized.cyan
theme.bar_indicator_fcitx_inactive = solarized.base01
theme.bar_indicator_fcitx_active = solarized.orange

theme.bar_indicator_cpu_low = solarized.green
theme.bar_indicator_cpu_medium = solarized.yellow
theme.bar_indicator_cpu_high = solarized.red

theme.bar_indicator_bat_charging_full = solarized.blue
theme.bar_indicator_bat_charging = solarized.cyan
theme.bar_indicator_bat_full = solarized.green
theme.bar_indicator_bat_medium = solarized.yellow
theme.bar_indicator_bat_low = solarized.red

theme.bar_indicator_volume_on = solarized.green
theme.bar_indicator_volume_off = solarized.magenta

theme.power_button_bg_normal = theme.base02
theme.power_button_bg_focus = solarized.base03

theme.menu_height = dpi(12)
theme.menu_width = dpi(200)

local dir = os.getenv('HOME') .. "/.config/awesome/themes/synth/"

theme.menu_submenu_icon = dir .. "/icons/submenu.svg"
theme.power_icon = dir .. "/icons/power.svg"

theme.tasklist_disable_icon = true
theme.tasklist_bg_focus = solarized.magenta
theme.tasklist_bg_normal = solarized.cyan
theme.tasklist_fg_normal = solarized.base1
theme.tasklist_fg_focus = solarized.base3

theme.wibar_ontop = true
theme.wibar_type = "dock"
theme.wibar_bg = solarized.base02
theme.wibar_fg = solarized.base3

-- Display the taglist squares
theme.taglist_disable_icon = true

-- Notifications
theme.notification_width = dpi(200)
theme.notification_height = dpi(50)
theme.notification_icon_size = dpi(50)
theme.notification_margin = dpi(10)

-- Define the image to load
theme.titlebar_fg_focus = colors.bg
theme.titlebar_close_button_normal = dir .. "/icons/close.svg"
theme.titlebar_close_button_focus = theme.titlebar_close_button_normal

theme.titlebar_floating_button_normal_inactive = dir .. "/icons/float_inactive.svg"
theme.titlebar_floating_button_focus_inactive = theme.titlebar_floating_button_normal_inactive
theme.titlebar_floating_button_normal_active = dir .. "/icons/float_active.svg"
theme.titlebar_floating_button_focus_active = theme.titlebar_floating_button_normal_active

local wallpaper_path = dir .. "/wallpapers/synth.jpg"
theme.wallpaper = function(s)
    gears.wallpaper.fit(wallpaper_path, s)
end

return theme