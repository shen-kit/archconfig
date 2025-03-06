#!/bin/bash

if pgrep -x "redshift" > /dev/null
then
    # redshift already running
    notify-send "INFO: Redshift Already Running" "Tried to run command 'redshift', but an instance of redshift was found"
else
    # redshift not running, start it
    redshift &
fi
