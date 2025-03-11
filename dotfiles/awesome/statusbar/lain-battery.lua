--[[
     Original Source Modified From: github.com/copycat-killer
     https://github.com/copycat-killer/awesome-copycats/blob/master/rc.lua.copland
--]]

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Standard awesome library
local lain = require("lain")

local W = Clone_widget_set

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

W.bat = lain.widget.bat({
	notify = true,
	full_notify = false,
	n_perc = { 7, 20 },
	bat = "BAT0",
	ac = "AC",
	timeout = 5,
	settings = function()
		local perc
		if
			BatNow.status == "Charging"
			or BatNow.status == "Discharging"
			or BatNow.status == "Not charging"
			or BatNow.status == "Full"
		then
			if BatNow.perc > 80 then
				perc = ""
			elseif BatNow.perc > 60 then
				perc = ""
			elseif BatNow.perc > 40 then
				perc = ""
			elseif BatNow.perc > 20 then
				perc = ""
			else
				perc = ""
			end

			perc = perc .. "  " .. BatNow.perc

			if BatNow.status == "Charging" then
				perc = perc .. "󱐋"
			else
				perc = perc .. "%"
			end
		else
			perc = "  -/-"
		end

		Widget:set_markup(perc)
	end,
})
