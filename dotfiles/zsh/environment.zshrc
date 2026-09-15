# ========== INTERACTIVE ZSH ==========

export WORDCHARS=${WORDCHARS//\/} # make ctrl+w/alt+backspace stop on '/'
export NIRI_SOCKET="/run/user/$(id -u)/niri.sock"
