local beautiful = require("beautiful")
local gears = require("gears")

local wallpaper = {}

function wallpaper.set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        else
            gears.wallpaper.maximized(wallpaper, s, true)
        end
    end
end

return wallpaper