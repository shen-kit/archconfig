#!/bin/bash

#####################################################################
#                       connect-monitors.sh                         #
# turn on connected monitors monitors and restart conky / awesomewm #
#####################################################################

# auto-detects connected hardware and sets xrandr settings based on saved profiles
autorandr --change

# restart conky and awesomewm
pkill conky
conky -c ~/.config/conky/conky.conf &
awesome-client 'awesome.restart()'

