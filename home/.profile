~/.bashscripts/setup_touchpad.sh
~/.bashscripts/connect-monitors.sh &
~/.bashscripts/rclone-download.sh &

[ -f "/home/shenkit/.ghcup/env" ] && . "/home/shenkit/.ghcup/env" # ghcup-env

# start ssh-agent if not already running, and add private key
# to avoid having to enter password every time it is used
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi
