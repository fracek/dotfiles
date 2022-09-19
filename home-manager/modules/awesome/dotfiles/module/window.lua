local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local window = {}

function window.setup_titlebar(c)
    local buttons = awful.util.table.join(awful.button({}, 1, function()
        client.focus = c
        c:raise()
        awful.mouse.client.move(c)
    end), awful.button({}, 3, function()
        client.focus = c
        c:raise()
        awful.mouse.client.resize(c)
    end))

    awful.titlebar(c):setup{
        {
            -- Left
            nil,
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal
        },
        {
            -- Middle
            {
                -- Title
                align = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal
        },
        {
            {
                -- Right
                -- awful.titlebar.widget.floatingbutton(c),
                -- awful.titlebar.widget.closebutton(c),
                layout = wibox.layout.fixed.horizontal()
            },
            margins = dpi(4),
            widget = wibox.container.margin
        },
        layout = wibox.layout.align.horizontal
    }
end

function window.setup_double_border(c)
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal('request::activate', 'titlebar', {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
            c:emit_signal('request::activate', 'titlebar', {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {
        size = beautiful.border_width or 2,
        position = 'top'
    }):setup({
        buttons = buttons,
        layout = wibox.layout.align.horizontal
    })

    awful.titlebar(c, {
        size = beautiful.border_width or 2,
        position = 'bottom'
    }):setup({
        buttons = buttons,
        layout = wibox.layout.align.horizontal
    })

    awful.titlebar(c, {
        size = beautiful.border_width or 2,
        position = 'left'
    }):setup({
        buttons = buttons,
        layout = wibox.layout.align.horizontal
    })

    awful.titlebar(c, {
        size = beautiful.border_width or 2,
        position = 'right'
    }):setup({
        buttons = buttons,
        layout = wibox.layout.align.horizontal
    })
end

function window.show_titlebar_on_floating(c)
    if c.floating then
        awful.titlebar.show(c)
    else
        awful.titlebar.hide(c)
    end
end

function window.always_show_titlebar(c)
    awful.titlebar.show(c)
end

function window.draw_focused_border(c)
    c.border_color = beautiful.border_focus
end

function window.draw_unfocused_border(c)
    c.border_color = beautiful.border_normal
end

function window.set_as_slave(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end

function window.draw_top_border(c)
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal('request::activate', 'titlebar', {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
            c:emit_signal('request::activate', 'titlebar', {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {
        size = 2 * beautiful.border_width or 4,
        position = 'top',
        bg_normal = beautiful.border_normal,
        bg_focus = beautiful.border_focus,
    }):setup({
        buttons = buttons,
        layout = wibox.layout.align.horizontal
    })

    awful.titlebar(c, {
        size = beautiful.border_width or 2,
        position = 'bottom',
        bg_normal = beautiful.border_normal,
        bg_focus = beautiful.border_focus,
    }):setup({
        buttons = buttons,
        layout = wibox.layout.align.horizontal
    })

    awful.titlebar(c, {
        size = beautiful.border_width or 2,
        position = 'left'
    }):setup({
        buttons = buttons,
        layout = wibox.layout.align.horizontal
    })

    awful.titlebar(c, {
        size = beautiful.border_width or 2,
        position = 'right'
    }):setup({
        buttons = buttons,
        layout = wibox.layout.align.horizontal
    })
end

function window.draw_rounded_border(c)
    if not c.fullscreen then
        c.shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, beautiful.border_width)
        end
    else
        c.shape = gears.shape.rectangle
    end
end

function window.hide_border(c)
    c.border_width = 0
end

function window.manage_compton_shadow(c)
    if c.floating and not c.maximized and not c.fullscreen then
        awful.spawn("xprop -id " .. c.window .. " -f _COMPTON_SHADOW 32c -set _COMPTON_SHADOW 1")
    else
        awful.spawn("xprop -id " .. c.window .. " -f _COMPTON_SHADOW 32c -set _COMPTON_SHADOW 0")
    end
end

return window
