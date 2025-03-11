local awful = require("awful")
local gears = require("gears")

Clone_widget_set.textclock = awful.widget.textclock("%a %d %b  |  %I:%M%P")

local cal = awful.widget.calendar_popup.month({
	start_sunday = true,
	long_weekdays = true,
	font = "Monaspace Radon 9",
	style_month = {
		padding = 12,
		shape = gears.shape.rounded_rect,
	},
	style_header = { border_width = 0 },
	style_normal = {
		border_width = 0,
		opacity = 0.9,
	},
	style_weekday = {
		border_width = 0,
		opacity = 0.7,
	},
})
cal:attach(Clone_widget_set.textclock, "tm")
