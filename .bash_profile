export PATH=$PATH:/usr/local/bin

export EDITOR=/usr/local/bin/nvim
export CLICOLOR= LSCOLORS=dxfxcxdxbxegedabagacad

alias ls="ls -G"
alias ll="ls -al"

alias vim=nvim
set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Create a .bashrc file for non-source controled configurations
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
