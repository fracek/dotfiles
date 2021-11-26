local config = {}

config.modkey = "Mod4"

local terminal = "alacritty"
local editor = os.getenv("EDITOR") or os.getenv("VISUAL") or "vim"
local editor_cmd = terminal .. " -e " .. editor

config.apps = {
    terminal = terminal,
    editor = editor,
    editor_cmd = editor_cmd
}

return config