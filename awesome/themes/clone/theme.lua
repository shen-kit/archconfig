local awful = require("awful")
awful.util = require("awful.util")

Theme_path = awful.util.getdir("config") .. "/themes/clone/"

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

Theme = {}

dofile(Theme_path .. "elements.lua")
dofile(Theme_path .. "notifications.lua")

Theme.wallpaper = Theme_path .. "background.jpg"

return Theme
