#!/bin/bash

# Helper script, used to toggle fuzzel on and off from a single command
# e.g. the same key which opens fuzzel will close it

# Usage:
# Add the following line ~/.config/niri/config.kdl:
#   <key> repeat=false { spawn "bash" "/path/to/this_script.sh"; }

PREV_FUZZEL_PID=$(pidof fuzzel)
if [[ -z "$PREV_FUZZEL_PID" ]]; then
  fuzzel "$@"
else
  kill "$PREV_FUZZEL_PID"
fi
