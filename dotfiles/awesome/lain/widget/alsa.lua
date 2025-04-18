--[[

     Licensed under GNU General Public License v2
      * (c) 2013, Luca CPZ
      * (c) 2010, Adrian C. <anrxc@sysphere.org>

--]]

local helpers = require("lain.helpers")
local wibox = require("wibox")
local string = string

-- ALSA volume
-- lain.widget.alsa

local function factory(args)
	args = args or {}
	local alsa = { widget = args.widget or wibox.widget.textbox() }
	local timeout = args.timeout or 5
	local settings = args.settings or function() end

	alsa.cmd = args.cmd or "amixer"
	alsa.channel = args.channel or "Master"
	alsa.togglechannel = args.togglechannel

	local format_cmd = string.format("%s get %s", alsa.cmd, alsa.channel)

	alsa.last = {}

	function alsa.update()
		helpers.async(format_cmd, function(mixer)
			local l, s = string.match(mixer, "([%d]+)%%.*%[([%l]*)")
			l = tonumber(l)
			if alsa.last.level ~= l or alsa.last.status ~= s then
				VolumeNow = { level = l, status = s }
				Widget = alsa.widget
				settings()
				alsa.last = VolumeNow
			end
		end)
	end

	helpers.newtimer(string.format("alsa-%s-%s", alsa.cmd, alsa.channel), timeout, alsa.update)

	return alsa
end

return factory
