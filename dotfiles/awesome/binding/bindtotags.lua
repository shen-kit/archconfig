-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey


function _M.get(globalkeys)
  for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,

      -- view tag only
      awful.key({ modkey }, "#" .. i + 9,
        function()
          local tag = awful.screen.focused().tags[i]
          if tag then
            tag:view_only()
          end
        end,
        { description = "view tag only", group = "tag" }),

      -- Move client to tag.
      awful.key({ modkey, "Control" }, "#" .. i + 9,
        function()
          if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
              client.focus:move_to_tag(tag)
            end
          end
        end,
        { description = "move focused client to tag #" .. i, group = "tag" }),

      -- Toggle tag display.
      awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
        function()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then
            awful.tag.viewtoggle(tag)
          end
        end,
        { description = "toggle tag #" .. i, group = "tag" })

    )
  end

  return globalkeys
end

return setmetatable({}, {
  __call = function(_, ...) return _M.get(...) end
})
