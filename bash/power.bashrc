alias suspend="systemctl suspend"

# turn on/off monitor and laptop screens
alias laptop-on="xrandr --output eDP-1 --mode 1280x720; xrandr --output DP-1 --off; xrandr --output DP-3 --off; xrandr --output DP-2 --off; pkill conky; conky & disown; awesome-client 'awesome.restart()'"
