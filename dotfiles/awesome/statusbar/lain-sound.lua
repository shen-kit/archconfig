---@diagnostic disable: undefined-global
--[[
     Original Source Modified From: github.com/copycat-killer
     https://github.com/copycat-killer/awesome-copycats/blob/master/rc.lua.copland
--]]

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Wibox handling library
local lain = require("lain")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ALSA volume from copycat-multicolor

Clone_widget_set.volume = lain.widget.alsa({
  settings = function()
    local disp
    if volume_now.status == "off" then
      disp = "󰝟" .. " " .. volume_now.level .. "%"
      widget:set_markup(disp)
      return
    elseif volume_now.level >= 50 then
      disp = " "
    elseif volume_now.level >= 10 then
      disp = ""
    else
      disp = ""
    end

    disp = disp .. " " .. volume_now.level .. "%"
    widget:set_markup(disp)
  end
})

Theme.volume = Clone_widget_set.volume
