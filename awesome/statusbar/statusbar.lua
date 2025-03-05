-- Standard awesome library
local gears   = require("gears")
local awful   = require("awful")

-- Wibox handling library
local wibox   = require("wibox")

-- Custom Local Library: Wallpaper, Keys and Mouse Binding
local deco    = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}

local _M      = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local WB      = {}
Wibox_package = WB -- global object name

-- default statusbar
require("statusbar.wibar-creation")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar

function WB.setup_common_boxes(s)
  -- Wallpaper
  SetWallpaper(s)

  -- Create a taglist widget
  s.taglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = WB.taglist
  }

  -- Create a tasklist widget
  s.tasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.focused, -- only show current app
    buttons = WB.tasklist,
    style   = {
      shape = gears.shape.rounded_rect,
      shape_border_width = 4,
      shape_border_color = Theme.bg_normal,
      align = "center",
    },
    layout  = {
      spacing        = 20,
      spacing_widget = {
        {
          forced_width = 4,
          shape        = gears.shape.circle,
          widget       = wibox.widget.separator
        },
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
      },
      layout         = wibox.layout.flex.horizontal
    }
  }
end

-- }}}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- create taglist and tasklist, then add a wibox to each screen
function _M.init()
  WB.taglist  = deco.taglist()
  WB.tasklist = deco.tasklist()

  awful.screen.connect_for_each_screen(function(s)
    WB.setup_common_boxes(s)

    WB.generate_wibox_one(s)
  end)
end

-- }}}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function() return _M.init() end })
