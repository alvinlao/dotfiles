#!/bin/bash

# Link vimrc
ln -sf $(pwd)/.vimrc  ~/.vimrc

# Mac
if [ "$(uname)" == "Darwin" ]; then
    ln -sf $(pwd)/.bash_profile ~/.bash_profile
else
    ln -sf $(pwd)/.bash_aliases ~/.bash_aliases
fi

# Vim plugin manager: vim-plug
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
