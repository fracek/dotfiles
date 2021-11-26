local beautiful = require("beautiful")
local menubar = require("menubar")
-- local freedesktop = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local config = require("config")

local menu = {}

menubar.utils.terminal = config.apps.terminal

menu.awesome_menu = {
    { "hotkeys", function() return false, hotkeys_popup.show_help end },
    { "manual", config.apps.terminal .. " -e man awesome" },
    { "restart", awesome.restart },
    { "logout", function () awesome.quit() end },
    { "quit", function() awesome.quit() end },
}

--[[
menu.main_menu = freedesktop.menu.build {
    icon_size = beautiful.menu_height or 16,
    before = {
        { "Awesome", menu.awesome_menu, beautiful.awesome_icon },
    },
    after = {
        { "Terminal", config.apps.terminal },
    },
}
]]

return menu