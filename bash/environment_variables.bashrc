# path
# export PATH="/var/lib/flatpak/app/org.wezfurlong.wezterm/current/active/export/bin:$PATH"
export PATH="/usr/bin/wezterm-gui:$PATH"

# default text editor
export EDITOR=nvim
export VISUAL=nvim

# how much detail to show in rclone output
export RCLONE_VERBOSE=0

# starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# colourise less output
export LESS=R

# make Ruby gems executable
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# dark theme
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark
