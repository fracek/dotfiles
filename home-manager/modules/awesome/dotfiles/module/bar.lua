local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local vicious = require("vicious")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local menu = require("module.menu")
-- local fcitx = require("widgets.fcitx")

local top_indicator_height = dpi(4)

local bar = {}

local function create_taglist(s)
    local taglist_buttons = awful.util.table.join(awful.button({}, 1, function(t) t:view_only() end),
        awful.button({}, 3, awful.tag.viewtoggle))

    return awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        layout = {
            spacing = 1,
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    wibox.widget.base.make_widget(),
                    forced_height = top_indicator_height,
                    id = "background_role",
                    widget = wibox.container.background,
                },
                {
                    {
                        id = "text_role",
                        widget = wibox.widget.textbox,
                    },
                    left = dpi(2),
                    right = dpi(2),
                    widget = wibox.container.margin
                },
                nil,
                layout = wibox.layout.align.vertical,
            },
            left = dpi(2),
            right = dpi(2),
            widget = wibox.container.margin
        },
    }
end

local function create_tasklist(s)
    return awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = nil,
        layout = {
            spacing = 1,
            layout = wibox.layout.flex.horizontal
        },
        widget_template = {
            {
                wibox.widget.base.make_widget(),
                forced_height = top_indicator_height,
                id = "background_role",
                widget = wibox.container.background,
            },
            {
                {
                    {
                        id = "text_role",
                        widget = wibox.widget.textbox,
                    },
                    halign = 'center',
                    valign = 'center',
                    widget = wibox.container.place,
                },
                margins = dpi(2),
                widget = wibox.container.margin
            },
            layout = wibox.layout.align.vertical,
        },
    }
end

local function bar_indicator(args)
    return wibox.widget {
        {
            wibox.widget.base.make_widget(),
            forced_height = top_indicator_height,
            id = "background_role",
            bg = args["bar_color"],
            widget = wibox.container.background,
        },
        args["widget"],
        layout = wibox.layout.align.vertical,
    }
end

local function add_margin(widget)
    return wibox.container.margin(widget, dpi(10), dpi(10))
end

local function create_systray(s)
    local w = bar_indicator {
        bar_color = beautiful.bar_indicator_systray,
        widget = {
            {
                {
                    {
                        widget = wibox.widget.systray
                    },
                    id = "systray_role",
                    visible = false,
                    left = dpi(10),
                    right = dpi(10),
                    widget = wibox.container.margin
                },
                bg = beautiful.bg_systray,
                widget = wibox.container.background,
            },
            {
                id = "button_role",
                text = "SYS",
                widget = wibox.widget.textbox
            },
            spacing = 0,
            layout = wibox.layout.fixed.horizontal,
        }
    }

    w:connect_signal("button::press", function(c)
        local s = w:get_children_by_id("systray_role")[1]
        s.visible = not s.visible
    end)

    return w
end

local function create_clock(s)
    return bar_indicator {
        bar_color = beautiful.bar_indicator_clock,
        widget = {
            widget = wibox.widget.textclock,
            format = "%k:%M %a %b %d"
        }
    }
end

local function create_cpu(s)
    local w = bar_indicator {
        bar_color = beautiful.bar_indicator_cpu_low,
        widget = {
            id = "cpu_role",
            widget = wibox.widget.textbox
        }
    }

    local function update_widget(w, args)
        local bg = w:get_children_by_id("background_role")[1]
        local cpu = args[1]
        if cpu < 30 then
            bg.bg = beautiful.bar_indicator_cpu_low
        elseif cpu < 70 then
            bg.bg = beautiful.bar_indicator_cpu_medium
        else
            bg.bg = beautiful.bar_indicator_cpu_high
        end

        w:get_children_by_id("cpu_role")[1].text = string.format("CPU %2s%%", cpu)
    end

    vicious.register(w, vicious.widgets.cpu, update_widget)

    return w
end

local function create_mem(s)
    local w = bar_indicator {
        bar_color = beautiful.bar_indicator_cpu_low,
        widget = {
            id = "mem_role",
            widget = wibox.widget.textbox
        }
    }

    local function update_widget(w, args)
        local bg = w:get_children_by_id("background_role")[1]
        local mem = args[1]
        if mem < 30 then
            bg.bg = beautiful.bar_indicator_cpu_low
        elseif mem < 70 then
            bg.bg = beautiful.bar_indicator_cpu_medium
        else
            bg.bg = beautiful.bar_indicator_cpu_high
        end

        w:get_children_by_id("mem_role")[1].text = string.format("MEM %2s%%", mem)
    end

    vicious.register(w, vicious.widgets.mem, update_widget)

    return w
end

local function create_battery(s)
    local w = bar_indicator {
        bar_color = beautiful.bar_indicator_bat_full,
        widget = {
            id = "bat_role",
            widget = wibox.widget.textbox
        }
    }

    local function update_widget(w, args)
        local state = args[1]
        local level = args[2]
        local remaining = args[3]

        local bg = w:get_children_by_id("background_role")[1]

        if state == "-" then
            -- Discharing
            if level < 30 then
                bg.bg = beautiful.bar_indicator_bat_low
            elseif level < 70 then
                bg.bg = beautiful.bar_indicator_bat_medium
            else
                bg.bg = beautiful.bar_indicator_bat_full
            end
        else
            -- Charging
            if level > 85 then
                bg.bg = beautiful.bar_indicator_bat_charging_full
            else
                bg.bg = beautiful.bar_indicator_bat_charging
            end
        end

        if remaining == "N/A" then
            remaining = "FULL"
        end

        w:get_children_by_id("bat_role")[1].text = string.format("BAT %2d%% %s", level, remaining)
    end

    vicious.register(w, vicious.widgets.bat, update_widget, 5, "BAT0")

    return w
end

local function create_volume(s)
    local w = bar_indicator {
        bar_color = beautiful.bar_indicator_volume_on,
        widget = {
            id = "vol_role",
            widget = wibox.widget.textbox
        }
    }

    local function update_widget(w, args)
        local level = args[1]
        local mute = args[2]

        local bg = w:get_children_by_id("background_role")[1]

        if mute == "♩" then
            bg.bg = beautiful.bar_indicator_volume_off
        else
            bg.bg = beautiful.bar_indicator_volume_on
        end

        w:get_children_by_id("vol_role")[1].text = string.format("VOL %d%%", level)
    end

    vicious.register(w, vicious.widgets.volume, update_widget, 1, "Master")

    return w
end

local function create_fcitx(s)
    local w = bar_indicator {
        bar_color = beautiful.bar_indicator_fcitx_inactive,
        widget = {
            id = "fcitx_role",
            widget = wibox.widget.textbox
        }
    }

    local function update_widget(w, args)
        local active = args[1]
        local text = w:get_children_by_id("fcitx_role")[1]
        local bg = w:get_children_by_id("background_role")[1]
        if active then
            text.text = "CN"
            bg.bg = beautiful.bar_indicator_fcitx_active
        else
            text.text = "EN"
            bg.bg = beautiful.bar_indicator_fcitx_inactive
        end
    end

    vicious.register(w, fcitx, update_widget, 1)

    return w
end

local function create_power_button(s)
    local icon_size = dpi(40)
    local w = wibox.widget {
        {
            {
                image = beautiful.power_icon,
                resize = true,
                widget = wibox.widget.imagebox
            },
            id = "background_role",
            bg = beautiful.power_button_bg_normal,
            widget = wibox.container.background,
            shape = gears.shape.circle,
        },
        top = dpi(4),
        bottom = dpi(4),
        right = dpi(10),
        widget = wibox.container.margin
    }

    local old_cursor, old_wibox
    w:connect_signal("mouse::enter", function(c)
        c:get_children_by_id("background_role")[1].bg = beautiful.power_button_bg_focus
        local wb = mouse.current_wibox
        old_cursor, old_wibox = wb.cursor, wb
        wb.cursor = "hand2"
    end)

    w:connect_signal("mouse::leave", function(c)
        c:get_children_by_id("background_role")[1].bg = beautiful.power_button_bg_normal
        if old_wibox then
            old_wibox.cursor = old_cursor
            old_wibox = nil
        end
    end)

    return w
end

function bar.set_bar(s)
    -- Each screen has its own tag table.
    awful.tag({ "一", "二", "三", "四", "五", "六", "七", "八", "九" }, s, awful.layout.layouts[1])

    s.mytaglist = create_taglist(s)
    s.mytasklist = create_tasklist(s)

    s.mysystray = add_margin(create_systray(s))
    s.myclock = add_margin(create_clock(s))
    s.mycpu = add_margin(create_cpu(s))
    s.mymem = add_margin(create_mem(s))
    s.mybattery = add_margin(create_battery(s))
    s.myvolume = add_margin(create_volume(s))
    -- s.myfictx = add_margin(create_fcitx(s))
    s.power_button = create_power_button(s)

    s.mywibox = awful.wibar {
        screen = s,
        position = "top",
        height = dpi(26),
        ontop = true
    }

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "inside",
        {
            -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
        {
            -- Middle widgets
            widget = wibox.container.margin,
            left = dpi(100),
            right = dpi(100),
            s.mytasklist, 
        },
        {
            -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            s.mysystray,
            -- s.myfictx,
            s.mymem,
            s.mycpu,
            s.myvolume,
            s.mybattery,
            s.myclock,
            --s.power_button,
        },
    }
end

return bar