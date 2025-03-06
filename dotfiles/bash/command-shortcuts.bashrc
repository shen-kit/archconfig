# ========== NVIM ==========

alias vim=nvim
alias vi=nvim
alias v=nvim
alias sv=sudoedit
alias fzf-nvim=nvimFind
alias fv='nvim "$(fzf)"'

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

alias cpwd="pwd | xsel -ib"   # copy current directory path to clipboard
alias cpc="xsel -ib < "                     # copy file contents to clipboard
alias cpat="xsel -ib < $HOME/gDrive/3_uni/gitlab-pat.txt"

# ========== BLUETOOTH / PERIPHERALS ==========

alias connect-bt-speaker="bluetoothctl connect F4:2B:7D:03:22:2F"
alias connect-bt-earphones="bluetoothctl connect 84:AC:60:1F:91:05"
alias connect-bt-headphones="bluetoothctl connect 2C:FD:B3:8C:50:89"

# ========== CODING / SCRIPTS ==========

# python
alias py="python"
alias pwds="py ~/compsci/projects/cli-password-manager/password-manager.py"

# GIT

alias lg="lazygit"
alias gl="git log --graph --color=always"
alias glo="git log --oneline --graph --color=always"
alias finances="finance-tracker /home/shenkit/gDrive/4_personal_documents/financial/finances.db"

# ========== MISC. ==========

alias ntfy="notify-send"
alias ii="xdg-open"
