---@diagnostic disable: undefined-global
--[[
     Original Source Modified From: github.com/copycat-killer
     https://github.com/copycat-killer/awesome-copycats/blob/master/rc.lua.copland
--]]

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Wibox handling library
local awful = require("awful")
local lain = require("lain")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ALSA volume from copycat-multicolor

Clone_widget_set.volume = lain.widget.alsa({
	settings = function()
		local disp
		if VolumeNow.status == "off" then
			disp = "󰝟" .. " " .. VolumeNow.level .. "%"
			Widget:set_markup(disp)
			return
		elseif VolumeNow.level >= 50 then
			disp = " "
		elseif VolumeNow.level >= 10 then
			disp = ""
		else
			disp = ""
		end

		disp = disp .. " " .. VolumeNow.level .. "%"
		Widget:set_markup(disp)
	end,
})

-- scroll to change volume, click to mute
Clone_widget_set.volume.widget:buttons(awful.util.table.join(
	awful.button({}, 4, function()
		os.execute(string.format("amixer -q set Master 2%%+"))
		Clone_widget_set.volume.update()
	end),
	awful.button({}, 5, function()
		os.execute(string.format("amixer -q set Master 2%%-"))
		Clone_widget_set.volume.update()
	end),
	awful.button({}, 1, function()
		os.execute(string.format("amixer -q set Master toggle"))
		Clone_widget_set.volume.update()
	end),
	awful.button({}, 3, function()
		awful.spawn.with_shell("flatpak run com.saivert.pwvucontrol")
		Clone_widget_set.volume.update()
	end)
))

Theme.volume = Clone_widget_set.volume
