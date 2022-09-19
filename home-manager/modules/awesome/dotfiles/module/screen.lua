local awful = require("awful")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local screen = {}

function screen.set_padding(s)
    local r = -1.5
    s.padding = {
        top = r * beautiful.useless_gap,
        bottom = r * beautiful.useless_gap,
        left = r * beautiful.useless_gap,
        right = r * beautiful.useless_gap,
    }
end

return screen
