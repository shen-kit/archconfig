pcall(require, "luarocks.loader")

-- awesome libraries

local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
require("awful.autofocus") -- autofocus windows after switching tags/screens

-- global namespace
RC = {}
RC.vars = require("main.user-variables")

require("main.error-handling")
require("main.theme")

-- -- --

-- Custom Local Library
local main = {
	layouts = require("main.layouts"),
	tags = require("main.tags"),
	rules = require("main.rules"),
}

-- Custom Local Library: Keys and Mouse Binding
local binding = {
	globalbuttons = require("binding.globalbuttons"),
	clientbuttons = require("binding.clientbuttons"),
	globalkeys = require("binding.globalkeys"),
	clientkeys = require("binding.clientkeys"),
	bindtotags = require("binding.bindtotags"),
}

-- Layouts
RC.layouts = main.layouts()

-- Tags
RC.tags = main.tags()

-- Menu
RC.launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = RC.mainmenu })
menubar.utils.terminal = RC.vars.terminal

-- Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- Rules
awful.rules.rules = main.rules(binding.clientkeys(), binding.clientbuttons())

-- Signals
require("main.signals")

-- Statusbar: Wibar
local statusbar = require("statusbar.statusbar")

statusbar()

require("main.startup")
