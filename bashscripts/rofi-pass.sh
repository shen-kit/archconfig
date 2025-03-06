# get a list of services in the correct format
services=$(find ~/.password-store/ -type f | awk -F '/' '($4 ~ "password") && ($5 !~ /^\..*/) { sub(/^.*store\//, ""); gsub(/\.gpg$/, ""); print }')

# open rofi for selection, case-insensitive search
selection=$(echo "$services" | rofi -dmenu -i)

# copy selection to clipboard
pass -c "$selection"
