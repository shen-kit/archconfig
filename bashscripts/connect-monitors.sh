#!/bin/bash

#####################################################################
#                       connect-monitors.sh                         #
# turn on connected monitors monitors and restart conky / awesomewm #
#####################################################################

pkill conky

# start with all external displays off, turn on whatever wants to be turned on
xrandr --output eDP-1 --mode 1280x720 --output DP-1 --off --output DP-2 --off --output DP-3 --off

# left monitor
if [[ ! -z $(xrandr | grep --invert-match "eDP-1" | grep "DP-1 connected") ]] then # connected
   xrandr --output DP-1 --mode 1920x1080 --primary --left-of eDP-1
fi

# right monitor
if [[ ! -z $(xrandr | grep --invert-match "eDP-1" | grep "DP-3 connected") ]] then # connected
   xrandr --output DP-3 --mode 1920x1080 --primary --right-of eDP-1 
fi

# restart conky and awesomewm
conky -c ~/.config/conky/conky.conf &
awesome-client 'awesome.restart()'

