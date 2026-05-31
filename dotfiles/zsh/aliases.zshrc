# ========== EDITOR ==========

alias v=nvim
alias vi=nvim
alias vim=nvim
alias sv=sudoedit

# ========== FILES / NAVIGATION ==========

# file browsers
(( $+commands[yazi] )) && alias y=yazi

# show directory stack + contents after successful directory changes
autoload -Uz add-zsh-hook
function list_after_cd() {
    dirs
    echo
    if (( $+commands[eza] )); then
        eza
    else
        command ls
    fi
    echo
}
add-zsh-hook chpwd list_after_cd

if (( $+commands[fzf] )); then
    alias fcd='cd "$(find . -type d | fzf)"'
    alias fz='cd "$(find . -type d | fzf)"'
fi
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

(( $+commands[bat] )) && alias cat=bat

if (( $+commands[eza] )); then
    alias l="eza"
    alias ls="eza"
    alias la="eza -a"
    alias l1="eza --oneline"
    alias ll="eza -l"
    alias lla="eza -la"
    alias lsd="eza -D"
    alias tree="eza -T"
else
    alias l="ls"
    alias la="ls -a"
    alias l1="ls -1"
    alias ll="ls -l"
    alias lla="ls -la"
    alias lsd="find . -maxdepth 1 -type d -print"
fi

alias lss="du -sh * | sort -hr"  # list file/folder sizes descending

alias mkdir="mkdir -p"                             # create parent directories
function mkcd() { mkdir -pv -- "$1" && cd -- "$1"; } # make + enter directory
function rm() {                                    # use trash-cli, fallback to default rm
    if (( $+commands[trash] )); then
        trash "$@" || command rm "$@"
    else
        command rm "$@"
    fi
}

alias cls=clear                                    # clear terminal screen

# interactive mode by default (ask to override)
alias cp="cp -i"
alias mv="mv -i"

# ========== CLIPBOARD ==========

if (( $+commands[wl-copy] )); then
    alias cpwd="pwd | tr -d '\n'  | wl-copy"   # copy current directory path to clipboard
    alias cpc="wl-copy < "                     # copy file contents to clipboard
    alias cpat="wl-copy < $HOME/gDrive/3_uni/gitlab-pat.txt"
fi

# ========== CODING / SCRIPTS ==========

# python
alias py="python"

# git
alias lg="lazygit"
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto)  %D%n%s%n'"
alias glo="git log --oneline --graph"

# ========== MISC. ==========

alias ntfy="notify-send"
alias ii="xdg-open"
