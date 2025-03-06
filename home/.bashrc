# source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# load custom aliases and functions from ~/.bashrc.d
if [ -d ~/.config/bash ]; then 
	for rc in ~/.config/bash/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

# setup programs required at the end of .bashrc
eval "$(starship init bash)"
starship_precmd

eval "$(zoxide init bash)"

alias luamake="/home/shenkit/lua-language-server/3rd/luamake/luamake"
[ -f "/home/shenkit/.ghcup/env" ] && . "/home/shenkit/.ghcup/env" # ghcup-env for Haskell

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
