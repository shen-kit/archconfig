--[[
     Original Source Modified From: github.com/copycat-killer
     https://github.com/copycat-killer/awesome-copycats/blob/master/rc.lua.copland
--]]

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Standard awesome library
local lain = require("lain")

local W    = Clone_widget_set

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

W.bat      = lain.widget.bat({
  notify = true,
  full_notify = false,
  n_perc = { 7, 20 },
  bat = "BAT0",
  ac = "AC",
  timeout = 5,
  settings = function()
    local perc
    if bat_now.status == "Charging" or bat_now.status == "Discharging" or bat_now.status == "Not charging" or bat_now.status == "Full" then
      if bat_now.perc > 80 then
        perc = ""
      elseif bat_now.perc > 60 then
        perc = ""
      elseif bat_now.perc > 40 then
        perc = ""
      elseif bat_now.perc > 20 then
        perc = ""
      else
        perc = ""
      end

      perc = perc .. "  " .. bat_now.perc

      if bat_now.status == "Charging" then
        perc = perc .. "󱐋"
      else
        perc = perc .. "%"
      end
    else
      perc = "  -/-"
    end

    widget:set_markup(perc)
  end
})
