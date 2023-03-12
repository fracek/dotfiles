local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.font = "monospace 8"

theme.icon_theme = "Papirus"

-- rose pine

local colors = {
  base = "#191724",
  surface = "#1f1d2e",
  overlay = "#26233a",
  muted = "#6e6a86",
  subtle = "#908caa",
  text = "#e0def4",
  love = "#eb6f92",
  gold = "#f6c177",
  rose = "#ebbcba",
  pine = "#31748f",
  foam = "#9ccfd8",
  iris = "#c4a7e7",
  transparent = "#00000000",
}

theme.bg_normal = colors.base
theme.bg_focus = colors.rose
theme.fg_normal = colors.text
theme.fg_focus = colors.text
theme.fg_urgent = theme.fg_normal
theme.fg_minimize = theme.fg_normal

theme.useless_gap = dpi(32)
theme.border_width = dpi(3)
theme.border_normal = theme.bg_normal
theme.border_focus = theme.bg_focus
theme.border_marked = theme.border_normal

theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_bg_focus = theme.bg_normal

theme.taglist_bg_empty = colors.rose
theme.taglist_bg_normal = colors.rose
theme.taglist_fg_normal = colors.overlay
theme.taglist_bg_focus = colors.gold
theme.taglist_fg_focus = colors.gold
theme.taglist_bg_occupied = colors.rose
theme.taglist_fg_occupied = colors.overlay

theme.bar_indicator_clock = colors.rose
theme.bar_indicator_systray = colors.rose
theme.bar_indicator_fcitx_inactive = colors.rose
theme.bar_indicator_fcitx_active = colors.love

theme.bg_systray = theme.bar_indicator_systray

theme.bar_indicator_cpu_low = colors.foam
theme.bar_indicator_cpu_medium = colors.gold
theme.bar_indicator_cpu_high = colors.love

theme.bar_indicator_bat_charging_full = colors.foam
theme.bar_indicator_bat_charging = colors.iris
theme.bar_indicator_bat_full = colors.pine
theme.bar_indicator_bat_medium = colors.gold
theme.bar_indicator_bat_low = colors.love

theme.bar_indicator_volume_on = colors.rose
theme.bar_indicator_volume_off = colors.iris

theme.menu_height = dpi(12)
theme.menu_width = dpi(200)

local dir = os.getenv('HOME') .. "/.config/awesome/themes/synth/"

theme.menu_submenu_icon = dir .. "/icons/submenu.svg"
theme.power_icon = dir .. "/icons/power.svg"

theme.tasklist_disable_icon = true
theme.tasklist_bg_focus = colors.pine
theme.tasklist_bg_normal = colors.foam
theme.tasklist_fg_normal = colors.text
theme.tasklist_fg_focus = colors.text

theme.wibar_ontop = true
theme.wibar_type = "dock"
theme.wibar_bg = colors.transparent
theme.wibar_fg = colors.overlay

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
