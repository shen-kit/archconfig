local naughty               = require("naughty")
local nconf                 = naughty.config

local gears                 = require("gears")

nconf.padding               = 12 -- space between screen edge and notification
nconf.spacing               = 4  -- space between notifications

nconf.defaults.shape        = gears.shape.rounded_rect
nconf.defaults.border_width = 0
nconf.defaults.margin       = 10 -- space between notification text and box edge
nconf.defaults.timeout      = 3
nconf.defaults.max_width    = 350

nconf.presets.critical.bg   = "#e64553"
nconf.presets.normal.bg     = "#675380"
nconf.presets.low.bg        = "#209fb5"

Theme.notification_font     = "Arimo Nerd Font Propo 9"
