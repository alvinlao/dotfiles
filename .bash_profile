export PATH=$PATH:/usr/local/bin

export EDITOR=/usr/local/bin/vim
export CLICOLOR= LSCOLORS=dxfxcxdxbxegedabagacad

alias ls="ls -G"
alias ll="ls -al"

set -o vi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias vim=nvim

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
