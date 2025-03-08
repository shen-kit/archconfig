#!/bin/bash

####################################################################
#                       disconnect-monitors.sh                     #
# turn off monitors, turn on laptop, and restart conky / awesomewm #
####################################################################

xrandr --output eDP-1 --mode 1280x720 --output DP-1 --off --output DP-2 --off --output DP-3 --off;

# restart conky and awesomewm
pkill conky;
conky & disown;
awesome-client 'awesome.restart()'

