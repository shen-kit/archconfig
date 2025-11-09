waybar > /dev/null 2>&1 &
swaybg -i /home/shenkit/.config/mango/backgrounds/bg1_basketball.jpg > /dev/null 2>&1 &
# connect any monitor to the right by default
wlr-randr --output DP-1 --right-of eDP-1 > /dev/null 2>&1 &
wlr-randr --output DP-2 --right-of eDP-1 > /dev/null 2>&1 &
wlr-randr --output DP-3 --right-of eDP-1 > /dev/null 2>&1 &
