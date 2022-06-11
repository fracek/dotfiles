local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local config = require("config")
local menu = require("module.menu")

local keys = {}

local modkey = config.modkey

keys.root_buttons = awful.util.table.join(awful.button({}, 3, function() menu.main_menu:toggle() end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev))

keys.root_keys = awful.util.table.join(awful.key({ modkey, }, "F1", hotkeys_popup.show_help,
    { description = "show help", group = "awesome" }),
    awful.key({ modkey, }, "Left", awful.tag.viewprev,
        { description = "view previous", group = "tag" }),
    awful.key({ modkey, }, "Right", awful.tag.viewnext,
        { description = "view next", group = "tag" }),
    awful.key({ modkey, }, "Escape", awful.tag.history.restore,
        { description = "go back", group = "tag" }),

    awful.key({ modkey, }, "n", function() awful.client.focus.byidx(1) end,
        { description = "focus next by index", group = "client" }),
    awful.key({ modkey, }, "p", function() awful.client.focus.byidx(-1) end,
        { description = "focus previous by index", group = "client" }),

    -- Layout manipulation
    awful.key({ modkey, "Shift" }, "n", function() awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = "client" }),
    awful.key({ modkey, "Shift" }, "p", function() awful.client.swap.byidx(-1) end,
        { description = "swap with previous client by index", group = "client" }),
    awful.key({ modkey, "Control" }, "n", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }),
    awful.key({ modkey, "Control" }, "p", function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }),
    awful.key({ modkey, }, "u", awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }),
    awful.key({ modkey, }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" }),

    -- Standard program
    awful.key({ modkey, }, "Return", function() awful.spawn(config.apps.terminal) end,
        { description = "open a terminal", group = "launcher" }),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" }),
    awful.key({ modkey, "Control" }, "q", awesome.quit,
        { description = "quit awesome", group = "awesome" }),

    awful.key({}, "#121", function() awful.spawn("pactl set-sink-mute 0 toggle") end,
        { description = "toggle mute", group = "system" }),
    awful.key({}, "#122", function() awful.spawn("pactl set-sink-volume 0 -5%") end,
        { description = "lower volume", group = "system" }),
    awful.key({}, "#123", function() awful.spawn("pactl set-sink-volume 0 +5%") end,
        { description = "increase volume", group = "system" }),
    awful.key({}, "#198", function() awful.spawn("pactl set-source-mute 1 toggle") end,
        { description = "mute mic", group = "system" }),
    awful.key({}, "#232", function() awful.spawn("xbacklight -dec 10") end,
        { description = "brightness down", group = "system" }),
    awful.key({}, "#233", function() awful.spawn("xbacklight -inc 10") end,
        { description = "brightness up", group = "system" }),

    awful.key({ modkey, }, "space", function() awful.layout.inc(1) end,
        { description = "select next", group = "layout" }),
    awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }),

    awful.key({ modkey, "Control" }, "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                client.focus = c
                c:raise()
            end
        end,
        { description = "restore minimized", group = "client" }),

    awful.key({ modkey, "Shift" }, "j", function() awful.spawn("rofi -no-lazy-grab -show emoji -modi emoji -matching normal") end,
        { description = "show rofi emoji", group = "launcher" }),

    awful.key({ modkey, "Shift" }, "k", function() awful.spawn("rofi -no-lazy-grab -show calc -modi calc") end,
        { description = "show rofi calc", group = "launcher" }),

    awful.key({ modkey, "Shift" }, "r", function() awful.spawn("rofi -no-lazy-grab -show run") end,
        { description = "show rofi", group = "launcher" }),

    awful.key({ modkey, }, "r", function() awful.spawn("rofi -no-lazy-grab -show drun") end,
        { description = "show rofi drun", group = "launcher" }))

keys.client_keys = awful.util.table.join(awful.key({ modkey, }, "f",
    function(c)
        c.fullscreen = not c.fullscreen
        if c.screen.mywibox then
            c.screen.mywibox.visible = not c.fullscreen
        end
        c:raise()
    end,
    { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey,           }, "w", function(c) c:kill() end,
        { description = "close", group = "client" }),
    awful.key({ modkey, "Control" }, "f", awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }),
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
        { description = "move to master", group = "client" }),
    awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
        { description = "move to screen", group = "client" }),
    awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "client" }),
    awful.key({ modkey, }, "b",
        function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end,
        { description = "minimize", group = "client" }),
    awful.key({ modkey, }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = "maximize", group = "client" }))

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    keys.root_keys = awful.util.table.join(keys.root_keys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #" .. i, group = "tag" }),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" }),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "toggle focused client on tag #" .. i, group = "tag" }))
end

keys.client_buttons = awful.util.table.join(awful.button({}, 1, function(c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

return keys