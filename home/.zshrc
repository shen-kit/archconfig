# custom config from ~/.config/zsh
if [ -d ~/.config/zsh ]; then 
	for rc in ~/.config/zsh/*; do
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
autoload -U compinit
compinit
zinit cdreplay -q # only call compinit once, startup gains

# load ssh key from keychain if already loaded
if [ -f "$HOME/.keychain/$(hostname)-sh" ];then
  source "$HOME/.keychain/$(hostname)-sh"
fi

# start programs required at end of zshrc
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
