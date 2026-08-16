# custom config from ~/.config/zsh
if [ -d ~/.config/zsh ]; then
	for rc in ~/.config/zsh/*.zshrc(N); do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

# ===============================================================
# Plugins
# ===============================================================

# install zinit (if not installed)
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh" # load zinit
zinit ice atload'unalias zi'     # unalias zi (used for zoxide)

# get plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# load completions
autoload -Uz compinit
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p -- "${ZSH_COMPDUMP:h}"
if [[ ! -s "$ZSH_COMPDUMP" || -n "$(find "$ZSH_COMPDUMP" -mmin +1440 -print -quit 2>/dev/null)" ]]; then
  compinit -d "$ZSH_COMPDUMP"
else
  compinit -C -d "$ZSH_COMPDUMP"
fi
unset ZSH_COMPDUMP
zinit cdreplay -q # only call compinit once, startup gains

# ctrl x>e to edit current command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

eval "$(keychain --eval --quick --quiet)"

# start programs required at end of zshrc
eval "$(direnv hook zsh)"
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
