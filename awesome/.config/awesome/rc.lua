local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget

-- Extra widgets
local vicious = require("vicious")

do
    local theme_name = "synth"
    local theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/"
    beautiful.init(theme_dir .. theme_name .. "/theme.lua")
end

require("module.startup")

local layout = require("module.layout")
local keys = require("module.keys")
local bar = require("module.bar")
local rules = require("module.rules")
local mouse = require("module.mouse")
local window = require("module.window")
local wallpaper = require("module.wallpaper")
local screen_ = require("module.screen")

awful.layout.layouts = layout.layouts
awful.rules.rules = rules.rules

root.keys(keys.root_keys)
root.buttons(keys.root_buttons)

awful.screen.connect_for_each_screen(function(s)
    wallpaper.set_wallpaper(s)
    bar.set_bar(s)
    screen_.set_padding(s)
end)

screen.connect_signal("property::geometry", wallpaper.set_wallpaper)

client.connect_signal("property::floating", window.always_show_titlebar)
client.connect_signal("manage", window.set_as_slave)
client.connect_signal("manage", window.always_show_titlebar)
client.connect_signal("request::titlebars", window.setup_double_border)
client.connect_signal("focus", window.draw_focused_border)
client.connect_signal("unfocus", window.draw_unfocused_border)
client.connect_signal("mouse::enter", mouse.sloppy_focus)
