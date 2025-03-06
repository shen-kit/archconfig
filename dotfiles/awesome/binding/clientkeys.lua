-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local clientkeys = gears.table.join(

    awful.key({ modkey, "Shift" }, "w",
      function(c) c:kill() end,
      { description = "close", group = "client" }),
    awful.key({ modkey, "Control" }, "Return",
      function(c) c:swap(awful.client.getmaster()) end,
      { description = "move to master", group = "client" }),
    awful.key({ modkey }, "o",
      function(c)
        c:move_to_screen()
      end,
      { description = "move to screen", group = "client" }),
    awful.key({ modkey }, "t",
      function(c) c.ontop = not c.ontop end,
      { description = "toggle keep on top", group = "client" }),
    awful.key({ modkey, "Control" }, "space",
      awful.client.floating.toggle,
      { description = "toggle floating", group = "client" }),

    awful.key({ modkey }, "Down",
      function(c)
        c.minimized = true
      end,
      { description = "minimize", group = "client" }),

    -- maximise (horizontally / vertically)
    awful.key({ modkey }, "m",
      function(c)
        c.maximized = not c.maximized
        c:raise()
      end,
      { description = "(un)maximize", group = "client" }),
    awful.key({ modkey, "Control" }, "m",
      function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
      end,
      { description = "(un)maximize vertically", group = "client" }),
    awful.key({ modkey, "Shift" }, "m",
      function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
      end,
      { description = "(un)maximize horizontally", group = "client" })
  )

  return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
  __call = function() return _M.get() end
})
