local awful = require("awful")
local wibox = require("wibox")

require("statusbar.create-widgets")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local WB = Wibox_package

local sep1 = wibox.widget.textbox("    ")

function WB.add_widgets_left(s)
  return {
    layout = wibox.layout.fixed.horizontal,
    s.taglist,
    sep1,
  }
end

function WB.add_widgets_middle(_)
  return {
    layout = wibox.layout.flex.horizontal,
    wibox.container.place(
      Clone_widget_set.textclock,
      'center',
      'center'
    ),
  }
end

function WB.add_widgets_right(s)
  local cws = Clone_widget_set

  local t = {
    layout = wibox.layout.fixed.horizontal,
    sep1,
    cws.volume,
    sep1,
    cws.bat,
    sep1,
  }

  -- add the systray to the primary screen, hidden by default
  -- use Mod4+= to toggle visibility
  if s == screen.primary then
    s.systray = wibox.widget {
      layout = wibox.layout.align.horizontal,
      sep1,
      wibox.widget.systray(),
    }
    s.systray.visible = false
    table.insert(t, 1, s.systray)
  end

  return t
end

function WB.generate_wibox_one(s)
  -- create the wibox
  s.wibox_one = awful.wibar({ position = "top", screen = s, height = 26 })

  -- add widgets to the wibox
  s.wibox_one:setup {
    layout = wibox.layout.align.horizontal,
    expand = "none",
    WB.add_widgets_left(s),
    WB.add_widgets_middle(s),
    WB.add_widgets_right(s),
  }
end
