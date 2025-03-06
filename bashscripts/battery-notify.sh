#!/bin/bash

battery_level=$(cat /sys/class/power_supply/BAT0/capacity);
status=$(cat /sys/class/power_supply/BAT0/status);

if [[ $status == "Full" ]] then
    notify-send "Battery full, unplug from power" "$battery_level%"
elif [[ $status == "Charging" ]] && [[ $battery_level -ge 85 ]] then
    notify-send "Battery nearly full, unplug from power" "$battery_level%";
elif [[ $status == "Discharging" ]] && [[ $battery_level -le 20 ]] then
    notify-send "WARNING: Battery Very Low" "$battery_level%";
elif [[ $status == "Discharging" ]] && [[ $battery_level -le 35 ]] then
    notify-send "Battery low" "$battery_level%";
fi

