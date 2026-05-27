# terminal
export EDITOR=nvim
export VISUAL=nvim
export WORDCHARS=${WORDCHARS//\/} # make ctrl+w/alt+backspace stop on '/'
export LESS=R # colourise less output

export RCLONE_VERBOSE=0
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# theme
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

# dev
export GOPATH="$HOME/.local/share/go"
export GOMODCACHE="$HOME/.cache/go-modcache"
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export OPENSPEC_TELEMETRY=0
