# editor
export EDITOR=nvim
export VISUAL=nvim

# how much detail to show in rclone output
export RCLONE_VERBOSE=0

# starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# colourise less output
export LESS=R

export GOPATH="$HOME/dev/.go"

# make Ruby gems executable
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

# dark theme
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

# make ctrl+w/alt+backspace stop on '/' char
export WORDCHARS=${WORDCHARS//\/}
