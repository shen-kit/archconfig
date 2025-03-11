local awful = require("awful")
local gears = require("gears")

-- date and calendar
local date = awful.widget.textclock("%a %d %b")
Clone_widget_set.textdate = date

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
cal:attach(date, "tm")

-- clock
local clock = awful.widget.textclock("%I:%M%P")
Clone_widget_set.textclock = clock

clock:buttons(awful.util.table.join(awful.button({}, 1, function()
	if clock.format == "%I:%M%P" then
		-- show seconds
		clock.format = "%I:%M:%S%P"
		clock.refresh = 1
	else
		-- hide seconds
		clock.format = "%I:%M%P"
		clock.refresh = 60
	end
end)))
