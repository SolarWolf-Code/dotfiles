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
alias wifi="bash /home/wolf/.config/wifimenu.txt"

# alias for git clones (using key for private repos)
source github_token
alias gc='function _gc(){ url=$(echo $1 | sed "s/https:\/\///"); git clone "https://$GITHUB_TOKEN@$url"; };_gc'

# Rust moment
. "$HOME/.cargo/env"

# alias for micro (better nano)
alias mc="micro"
nano() {
    micro "$@"
}

# function for nnn (file manager)
alias n="nnn -e -H -r"
export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'
export EDITOR=micro
