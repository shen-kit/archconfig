#!/bin/bash

# start with all displays off, turn on whatever wants to be turned on
pkill conky

xrandr --output eDP-1 --mode 1280x720 --output DP-1 --off --output DP-2 --off --output DP-3 --off

# left monitor setup
if [[ ! -z $(xrandr | grep --invert-match "eDP-1" | grep "DP-1 connected") ]] then # connected
   xrandr --output DP-1 --mode 1920x1080 --primary --left-of eDP-1 #--output eDP-1 --mode 1280x720 --right-of DP-1
fi

# right single-monitor setup
if [[ ! -z $(xrandr | grep --invert-match "eDP-1" | grep "DP-3 connected") ]] then # connected
   xrandr --output DP-3 --mode 1920x1080 --primary --right-of eDP-1 
fi

# restart conky
# conky -c ~/.config/conky/conky.conf &
