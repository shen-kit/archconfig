#!/bin/bash

# ============================================================ 
# Send a notification to my phone (via Telegram) when laptop
# battery falls below THRESHOLD.
# 
# Called in crontab.
# ============================================================

THRESHOLD=20

battery_level=$(cat /sys/class/power_supply/BAT0/capacity);
status=$(cat /sys/class/power_supply/BAT0/status);

if [[ $status == "Discharging" ]] && [[ $battery_level -le THRESHOLD ]] then
    ~/.bashscripts/ntfyPhone "Charge your laptop. Battery: $battery_level%."
fi
