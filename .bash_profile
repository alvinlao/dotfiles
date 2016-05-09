export PATH=$PATH:/usr/local/bin
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export EDITOR=/usr/local/bin/vim
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export CLICOLOR= LSCOLORS=dxfxcxdxbxegedabagacad

alias ls="ls -G"
alias ll="ls -al"

set -o vi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
