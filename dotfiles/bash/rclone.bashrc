alias obsidian-upload="rclone sync ~/gDrive/1_obsidian/ gdrive:1_obsidian"

# both
alias rclone-upload="~/.config/rclone/rclone-upload.sh"
alias rclone-download="~/.config/rclone/rclone-download.sh"

# status
alias rs="tail -5 ~/.cache/rclone/rclone.log" # most recent status update
alias rsh="cat .cache/rclone/rclone.log | head -1" # download finished yet?

