# ========== NVIM ==========

alias v=nvim
alias vi=nvim
alias vim=nvim
alias sv=sudoedit

# ========== FILES / NAVIGATION ==========

# file browsers
alias y=yazi

# call ls after zoxide, unless going back to home dir
function cd() {
    if [ $# -eq 0 ]; then
        z ~
    else
        z "$1"
        dirs
        echo
        eza
        echo
    fi
} 

alias fcd='cd "$(find . -type d | fzf)"'
alias fz='cd "$(find . -type d | fzf)"'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias cat=bat

alias l="eza"
alias ls="eza"
alias la="eza -a"
alias l1="eza --oneline"
alias ll="eza -l"
alias lla="eza -la"
alias lsd="eza -D"

alias lss="du -sh * | sort -hr"  # list file/folder sizes descending
alias tree="eza -T"

alias mkdir="mkdir -p"                          # create parent directories
function mkcd () { mkdir -pv $1; cd $1; }       # make + enter directory
alias rm="trash"                                # use trash-cli, if fail then use default rm

alias cls=clear                                 # clear terminal screen

# interactive mode by default (ask to override)
alias cp="cp -i"
alias mv="mv -i"

# ========== CLIPBOARD ==========

alias cpwd="pwd | wl-copy"   # copy current directory path to clipboard
# alias cpwd="pwd | xsel -ib"   # copy current directory path to clipboard
alias cpc="wl-copy < "                     # copy file contents to clipboard
alias cpat="wl-copy < $HOME/gDrive/3_uni/gitlab-pat.txt"

# ========== BLUETOOTH / PERIPHERALS ==========

alias connect-bt-speaker="bluetoothctl connect F4:2B:7D:03:22:2F"
alias connect-bt-earphones="bluetoothctl connect 84:AC:60:1F:91:05"
alias connect-bt-headphones="bluetoothctl connect 2C:FD:B3:8C:50:89"

# ========== CODING / SCRIPTS ==========

# python
alias py="python"

# git

alias lg="lazygit"
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto)  %D%n%s%n'"
alias glo="git log --all --graph --pretty=format:'%C(magenta)%h %an %C(auto)> %s'"


# finance tracker
alias finances="finance-tracker /home/shenkit/gDrive/4_personal_documents/financial/finances.db"

# ========== MISC. ==========

alias ntfy="notify-send"
alias ii="xdg-open"
