local awful = require("awful")

local layout = {}

layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.max,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating,
}

return layout