#!/bin/bash

notify-send "Rclone Obsidian Download" "download starting"
rclone sync gdrive:/1_obsidian/ $HOME/gdrive/1_obsidian/
notify-send "Rclone Obsidian Download" "download finished"
