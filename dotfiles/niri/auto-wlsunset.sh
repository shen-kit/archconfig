#!/bin/sh

DEFAULT_LAT="-37.8136"
DEFAULT_LON="144.9631"

CONTENT=$(curl -s --connect-timeout 5 http://ip-api.com)

# curl failed, likely no internet
if [ $? -eq 0 ] && [ -n "$CONTENT" ]; then
    latitude=$(echo "$CONTENT" | jq -r .lat)
    longitude=$(echo "$CONTENT" | jq -r .lon)
else
    latitude=$DEFAULT_LAT
    longitude=$DEFAULT_LON
fi

wlsunset -l "$latitude" -L "$longitude"

