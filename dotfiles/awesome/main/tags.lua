-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local tags = {}

  local tagpairs = {
    names  = { "一", "二", "三", "四", "五" },

    layout = RC.layouts[1]
  }

  -- Each screen has its own tag table.
  awful.screen.connect_for_each_screen(function(s)
    tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)
  end)

  return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable(
  {},
  { __call = function() return _M.get() end }
)
