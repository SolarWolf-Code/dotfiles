# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Terminal autocompletion
source ~/.local/share/blesh/ble.sh

eval "$(starship init bash)"

# use ?? for github copilot
eval "$(github-copilot-cli alias -- "$0")"

# WiFi selector
alias wifi="bash /home/wolf/Desktop/wifimenu.txt"

# alias for git clones
alias gc="git clone"

# alias for micro (better nano)
alias mc="micro"
nano() {
    micro "$@"
}

# function for nnn (file manager)
alias n="nnn -e -H -r"
export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'
export EDITOR=micro
