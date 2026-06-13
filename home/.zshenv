# minimal env for every zsh invocation, including non-interactive shells

# path helpers
typeset -U path PATH

_path_prepend_once() {
    local dir="$1"

    [[ -n "$dir" ]] || return
    (( ${path[(Ie)$dir]} )) || path=("$dir" $path)
}

# default apps
export EDITOR=nvim
export VISUAL=nvim
export LESS=R

# app config
export RCLONE_VERBOSE=0
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export OPENSPEC_TELEMETRY=0

# gui theme
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

# dev env
export GOPATH="$HOME/.local/share/go"
export GOMODCACHE="$HOME/.cache/go-modcache"
export ANDROID_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

# tool paths
_path_prepend_once "$HOME/dev/flutter/bin"
_path_prepend_once "$ANDROID_HOME/platform-tools"
_path_prepend_once "$ANDROID_HOME/cmdline-tools/latest/bin"
_path_prepend_once "$HOME/bin"
_path_prepend_once "$HOME/.local/bin"
_path_prepend_once "$HOME/.bashscripts"
_path_prepend_once "$HOME/.local/share/npm/bin"
_path_prepend_once "$HOME/dev/.go/bin"
_path_prepend_once "/usr/local/go/bin"
_path_prepend_once "$HOME/.cargo/bin"

export PATH
unfunction _path_prepend_once
