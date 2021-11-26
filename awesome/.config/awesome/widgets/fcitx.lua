-- fcitx widget

local helpers = require("vicious.helpers")

local fcitx = {}

function worker(format, warg)
    local cmd = "fcitx-remote"

    local f = io.popen(cmd)
    local fcitx = f:read("*all")
    f:close()

    local status = string.match(fcitx, "([%d])")
    if status == "2" then
        return { true }
    end
    return { false }
end

return setmetatable(fcitx, { __call = function(_, ...) return worker(...) end })
