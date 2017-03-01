export PATH=$PATH:/usr/local/bin

export EDITOR=/usr/local/bin/nvim
export CLICOLOR= LSCOLORS=dxfxcxdxbxegedabagacad
export PS1="\W $(tput bold)λ$(tput sgr0) "

alias ls="ls -G"
alias ll="ls -al"

alias vim=nvim
set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Create a .bashrc file for non-source controled configurations
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
