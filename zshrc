# Path to your oh-my-zsh installation.
  export ZSH=/home/povilas/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

# User configuration

  export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:/usr/sbin"

source $ZSH/oh-my-zsh.sh

bindkey -v
bindkey "^R" history-incremental-search-backward
setopt no_share_history

alias grc='cd /home/povilas/studies/recurse-center'
alias br='xrandr --output LVDS1 --brightness'

# Copy working directory
alias cwd='echo -n `pwd` | xsel'
alias xs='xonsh'
