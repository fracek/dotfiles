local awful = require("awful")

local mouse = {}

function mouse.sloppy_focus(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier and awful.client.focus.filter(c) then
        client.focus = c
    end
end

return mouse