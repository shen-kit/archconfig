--[[
     Original Source Modified From: github.com/copycat-killer
     https://github.com/copycat-killer/awesome-copycats/blob/master/rc.lua.multicolor
--]]

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local awful       = require("awful")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local W           = {}
Clone_widget_set  = W

-- progress bar related widgets
local config_path = awful.util.getdir("config") .. "statusbar/"
dofile(config_path .. "lain-battery.lua")
dofile(config_path .. "lain-sound.lua")

W.textclock = awful.widget.textclock("%a %d %b  |  %I:%M%P")
