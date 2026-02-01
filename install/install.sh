#!/bin/bash
# Author: Shen-Kit Hia

set -euo pipefail
IFS=$'\n\t'

# keep sudo session alive
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi

REAL_USER=$SUDO_USER
REAL_HOME=$(getent passwd "$REAL_USER" | cut -d: -f6)

echo "Installing for user: "$REAL_USER" in "$REAL_HOME""

#========================#
# Helper Functions
#========================#

REPORT_FILE="$REAL_HOME/install_report.txt"
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

log "Updating system"
sudo pacman -Syu --noconfirm

log "Installing packages"
source ./install-packages.sh
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

log "installing tpm for tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

log "===== Done! ====="
