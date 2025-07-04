---@diagnostic disable: undefined-global

local gears = require("gears")
local awful = require("awful")

local beautiful = require("beautiful")

-- Resource Configuration
local modkey = RC.vars.modkey
local altkey = RC.vars.altkey
local terminal = RC.vars.terminal
local browserPersonal = RC.vars.browserPersonal
local browserUni = RC.vars.browserUni
local browserWork = RC.vars.browserWsp
local fileExplorer = RC.vars.fileExplorer

local _M = {}

-- ==================== HELPER FUNCTIONS ====================
local function sendToSpotify(command)
	return function()
		awful.util.spawn_with_shell(
			"dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player."
				.. command
		)
	end
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
	local globalkeys = gears.table.join(

		awful.key({ modkey }, "space", function()
			awful.spawn.easy_async_with_shell("/home/shenkit/toggle_graphite.sh")
			awful.spawn.easy_async_with_shell("ntfy 'toggled keyboard layout'")
		end, {
			description = "toggle graphite keyboard layout",
		}),

		-- awesome
		awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
		awful.key({ modkey, "Control" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
		awful.key({ modkey }, "w", function()
			for s in screen do
				s.wibox_one.visible = not s.wibox_one.visible
				if s.wibox_two then
					s.wibox_two.visible = not s.wibox_two.visible
				end
			end
		end, { description = "toggle wibox", group = "awesome" }),

		-- toggle systray visibility
		awful.key({ modkey }, "=", function()
			screen.primary.systray.visible = not screen.primary.systray.visible
		end, { description = "show help", group = "awesome" }),

		-- switch tags
		awful.key({ modkey }, "h", function()
			awful.tag.viewprev()
		end, { description = "view previous", group = "switch tags" }),
		awful.key({ modkey }, "l", function()
			awful.tag.viewnext()
		end, { description = "view next", group = "switch tags" }),

		-- window focus
		awful.key({ modkey }, "j", function()
			awful.client.focus.byidx(-1)
		end, { description = "focus previous by index", group = "window focus" }),
		awful.key({ modkey }, "k", function()
			awful.client.focus.byidx(1)
		end, { description = "focus next by index", group = "window focus" }),
		awful.key({ modkey, "Shift" }, "j", function()
			awful.client.swap.byidx(-1)
		end, { description = "swap with previous client", group = "window focus" }),
		awful.key({ modkey, "Shift" }, "k", function()
			awful.client.swap.byidx(1)
		end, { description = "swap with next client", group = "window focus" }),
		awful.key({ modkey, "Control" }, "j", function()
			awful.screen.focus_relative(1)
		end, { description = "focus next screen", group = "window focus" }),
		awful.key({ modkey, "Control" }, "k", function()
			awful.screen.focus_relative(-1)
		end, { description = "focus previous screen", group = "window focus" }),

		-- launch applications
		awful.key({ modkey }, "r", function()
			os.execute("rofi -show drun -sort")
		end, { description = "launch rofi", group = "launch applications" }),
		awful.key({ modkey }, "Return", function()
			awful.spawn(terminal)
		end, { description = "open a terminal", group = "launch applications" }),
		awful.key({ modkey }, "s", function()
			awful.util.spawn("spotify")
		end, { description = "spotify", group = "launch applications" }),
		awful.key({ modkey }, "b", function()
			awful.spawn(browserPersonal)
		end, { description = "brave browser (personal profile)", group = "launch applications" }),
		awful.key({ modkey, "Shift" }, "b", function()
			awful.spawn(browserUni)
		end, { description = "brave browser (uni profile)", group = "launch applications" }),
		awful.key({ modkey, altkey }, "b", function()
			awful.spawn(browserWork)
		end, { description = "brave browser (work profile)", group = "launch applications" }),
		awful.key({ modkey }, "n", function()
			awful.spawn("obsidian")
		end, { description = "obsidian", group = "launch applications" }),
		awful.key({ modkey }, "e", function()
			awful.spawn(fileExplorer)
		end, { description = "file explorer", group = "launch applications" }),
		awful.key({ modkey }, ";", function()
			awful.spawn("rofi-charpicker.sh")
		end, { description = "emoji selector", group = "launch applications" }),
		awful.key({ modkey, "Shift" }, "p", function()
			awful.spawn("rofi-pass.sh")
		end, { description = "emoji selector", group = "launch applications" }),

		-- layout
		awful.key({ modkey, altkey }, "k", function()
			awful.tag.incmwfact(0.05)
		end, { description = "increase master width factor", group = "layout" }),
		awful.key({ modkey, altkey }, "j", function()
			awful.tag.incmwfact(-0.05)
		end, { description = "decrease master width factor", group = "layout" }),
		awful.key({ modkey, "Shift" }, "l", function()
			awful.tag.incncol(1, nil, true)
		end, { description = "increase the number of columns", group = "layout" }),
		awful.key({ modkey, "Shift" }, "h", function()
			awful.tag.incncol(-1, nil, true)
		end, { description = "decrease the number of columns", group = "layout" }),
		awful.key({ modkey }, "Up", function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", { raise = true })
			end
		end, { description = "restore minimized", group = "window focus" }),

		-- screenshot
		-- https://github.com/lcpz/dots/blob/master/bin/screenshot
		awful.key({}, "Print", function()
			awful.util.spawn("flameshot gui")
		end, { description = "screenshot selection to clipboard", group = "utilities" }),
		awful.key({ "Control" }, "Print", function()
			awful.util.spawn("flameshot screen -p screenshot")
		end, { description = "full screenshot to file", group = "utilities" }),

		-- Screen brightness
		awful.key({}, "XF86MonBrightnessUp", function()
			os.execute("brightnessctl s +5%")
		end, { description = "+5%", group = "utilities" }),
		awful.key({}, "XF86MonBrightnessDown", function()
			os.execute("brightnessctl s 5%-")
		end, { description = "-5%", group = "utilities" }),

		-- ALSA volume control
		awful.key({}, "XF86AudioRaiseVolume", function()
			os.execute(string.format("amixer -q set Master 2%%+"))
			beautiful.volume.update()
		end, { description = "volume up", group = "utilities" }),
		awful.key({}, "XF86AudioLowerVolume", function()
			os.execute(string.format("amixer -q set Master 2%%-"))
			beautiful.volume.update()
		end, { description = "volume down", group = "utilities" }),
		awful.key({}, "XF86AudioMute", function()
			os.execute(string.format("amixer -q set Master toggle"))
			beautiful.volume.update()
		end, { description = "toggle mute", group = "utilities" }),

		-- music controls
		awful.key({}, "XF86AudioPlay", sendToSpotify("PlayPause"), { description = "play/pause", group = "music" }),
		awful.key({}, "XF86AudioNext", sendToSpotify("Next"), { description = "next track", group = "music" }),
		awful.key({}, "XF86AudioPrev", sendToSpotify("Previous"), { description = "previous track", group = "music" }),
		awful.key(
			{ "Control", "Shift" },
			"space",
			sendToSpotify("PlayPause"),
			{ description = "play/pause", group = "music" }
		),
		awful.key(
			{ "Control", altkey },
			"Right",
			sendToSpotify("Next"),
			{ description = "next track", group = "music" }
		),
		awful.key(
			{ "Control", altkey },
			"Left",
			sendToSpotify("Previous"),
			{ description = "previous track", group = "music" }
		)
	)

	return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function()
		return _M.get()
	end,
})
