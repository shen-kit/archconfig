#!/bin/bash
# Author: Shen-Kit Hia

set -euo pipefail
IFS=$'\n\t'

#========================#
# Helper Functions
#========================#

REPORT_FILE="$HOME/install_report.txt"
log() {
  echo -e "[INFO] $1";
  echo -e "[INFO] $1" >> "$REPORT_FILE";
}
warn() {
  echo -e "[WARN] $1";
  echo -e "[WARN] $1" >> "$REPORT_FILE";
}
error() {
  echo -e "[ERROR] $1";
  echo -e "[ERROR] $1" >> "$REPORT_FILE";
}

#========================#
# Main Script
#========================#

# keep sudo session alive
if [ "$EUID" -ne 0 ]; then
    echo "Some commands in this script require sudo."
    sudo -v || exit 1
fi

while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

log "Updating system"
sudo pacman -Syu --noconfirm

# log "Installing packages"
# source ./install-packages.sh
log "Creating symlinks"
source ./create-symlinks.sh
log "Configuring systemd"
source ./configure-systemd.sh
log "Configuring cron"
source ./configure-cron.sh

log "Re-loading fonts"
fc-cache -fv

log "running `sudo npm i -g neovim`"
sudo npm install -g neovim

log "===== Done! ====="
