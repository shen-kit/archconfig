#!/bin/bash

####################################################################
#                       disconnect-monitors.sh                     #
# turn off monitors, turn on laptop, and restart conky / awesomewm #
####################################################################

xrandr --output eDP-1 --mode 1280x720;
xrandr --output DP-1 --off;
xrandr --output DP-3 --off;
xrandr --output DP-2 --off;
pkill conky;
conky & disown;
awesome-client 'awesome.restart()'

