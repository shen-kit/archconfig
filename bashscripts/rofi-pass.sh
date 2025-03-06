#!/bin/bash

##################################################
#                 rofi-pass.sh                   #
##################################################


# get a list of services in the correct format
services=$(find ~/.password-store/ -type f | awk -F '/' '($4 ~ "password") && ($5 !~ /^\..*/) { sub(/^.*store\//, ""); gsub(/\.gpg$/, ""); print }')

# open rofi for selection, case-insensitive search
selection=$(echo "$services" | rofi -dmenu -i)
pwd=$(pass show "$selection" | head -1)

# if a selection was made, type the password of the selected service
[[ "$pwd" != "Password Store" ]] && xdotool type "$pwd"
