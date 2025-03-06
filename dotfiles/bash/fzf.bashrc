# FZF mappings and options
[ -f /usr/share/fzf/shell/key-bindings.bash ] && source /usr/share/fzf/shell/key-bindings.bash

# default use ripgrep instead of find, respect .gitignore and include hidden files
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# preview files
export FZF_DEFAULT_OPTS="--height 60% -1 --layout=reverse-list --multi --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300'"
