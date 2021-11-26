local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.font = "Iosevka SS08 9"

theme.icon_theme = "Papirus"

local solarized = {
    base03 = "#002b36",
    base02 = "#073642",
    base01 = "#586e75",
    base00 = "#657b83",
    base0 = "#839496",
    base1 = "#93a1a1",
    base2 = "#eee8d5",
    base3 = "#fdf6e3",

    yellow = "#b58900",
    orange = "#cb4b16",
    red = "#dc322f",
    magenta = "#d33682",
    violet = "#6c71c4",
    blue = "#268bd2",
    cyan = "#2aa198",
    green = "#859900"
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

theme.useless_gap = dpi(2)
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

local dir = os.getenv('HOME') .. "/.config/awesome/themes/chameleon/"

theme.menu_submenu_icon = dir .. "/icons/submenu.svg"
theme.power_icon = dir .. "/icons/power.svg"

theme.tasklist_disable_icon = true
theme.tasklist_bg_focus = solarized.magenta
theme.tasklist_bg_normal = solarized.cyan

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

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/openSUSE/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_focus_inactive = "/usr/share/awesome/themes/openSUSE/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/openSUSE/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_focus_active = "/usr/share/awesome/themes/openSUSE/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/openSUSE/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_focus_inactive = "/usr/share/awesome/themes/openSUSE/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/openSUSE/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_focus_active = "/usr/share/awesome/themes/openSUSE/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = dir .. "/icons/float_inactive.svg"
theme.titlebar_floating_button_focus_inactive = theme.titlebar_floating_button_normal_inactive
theme.titlebar_floating_button_normal_active = dir .. "/icons/float_active.svg"
theme.titlebar_floating_button_focus_active = theme.titlebar_floating_button_normal_active

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/openSUSE/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_focus_inactive = "/usr/share/awesome/themes/openSUSE/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/openSUSE/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_focus_active = "/usr/share/awesome/themes/openSUSE/titlebar/maximized_focus_active.png"

local wallpaper_path = dir .. "/wallpapers/landscape.jpeg"
theme.wallpaper = function(s)
    gears.wallpaper.centered(wallpaper_path, s)
end


-- You can use your own layout icons like this:
theme.layout_fairh = "/usr/share/awesome/themes/openSUSE/layouts/fairhw.png"
theme.layout_fairv = "/usr/share/awesome/themes/openSUSE/layouts/fairvw.png"
theme.layout_floating = "/usr/share/awesome/themes/openSUSE/layouts/floatingw.png"
theme.layout_magnifier = "/usr/share/awesome/themes/openSUSE/layouts/magnifierw.png"
theme.layout_max = "/usr/share/awesome/themes/openSUSE/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/openSUSE/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/openSUSE/layouts/tilebottomw.png"
theme.layout_tileleft = "/usr/share/awesome/themes/openSUSE/layouts/tileleftw.png"
theme.layout_tile = "/usr/share/awesome/themes/openSUSE/layouts/tilew.png"
theme.layout_tiletop = "/usr/share/awesome/themes/openSUSE/layouts/tiletopw.png"
theme.layout_spiral = "/usr/share/awesome/themes/openSUSE/layouts/spiralw.png"
theme.layout_dwindle = "/usr/share/awesome/themes/openSUSE/layouts/dwindlew.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"
theme.opensuse_icon = "/usr/share/awesome/themes/openSUSE/opensusegeeko.png"

return theme