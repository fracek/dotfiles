local awful = require("awful")
local beautiful = require("beautiful")

local keys = require("module.keys")

local rules = {}

rules.rules = { -- All clients will match this rule.
{
    rule = {},
    properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = keys.client_keys,
        buttons = keys.client_buttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
}, -- Floating clients.
{
    rule_any = {
        instance = {"DTA", -- Firefox addon DownThemAll.
        "copyq", -- Includes session name in class.
        -- To fix Flash fullscreen issues if still seeing bottom bar
        -- For chromium change "plugin-container" to "exe"
        "plugin-container"},
        class = {"Arandr", "Sxiv", "pinentry"},
        name = {"Event Tester" -- xev.
        },
        role = {"AlarmWindow", -- Thunderbird's calendar.
        "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
        }
    },
    properties = {
        floating = true
    }
}, -- Add titlebars to normal clients and dialogs
{
    rule_any = {
        type = {"normal", "dialog"}
    },
    properties = {
        titlebars_enabled = true
    }
},
{
    rule_any = {
        type = {"utility"}
    },
    properties = {
        titlebars_enabled = false
    }
}}

return rules;
