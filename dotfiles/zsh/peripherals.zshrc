# ========== BLUETOOTH ==========

alias connect-bt-speaker="bluetoothctl connect F4:2B:7D:03:22:2F"
alias connect-bt-headphones="bluetoothctl connect 2C:FD:B3:8C:50:89"

# ========== WACOM ==========

alias wacom-pressure="xsetwacom set 'Wacom One by Wacom S Pen stylus' PressureCurve 15 50 40 100"
alias wacom-main-monitor="wacom-pressure; xsetwacom set 'Wacom One by Wacom S Pen stylus' Rotate none; xsetwacom set 'Wacom One by Wacom S Pen stylus' MapToOutput DP-3"
