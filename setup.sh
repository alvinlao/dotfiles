#!/bin/bash

# Link vimrc
ln -sf $(pwd)/.vimrc  ~/.vimrc

# Link tmux
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf

# Mac
if [ "$(uname)" == "Darwin" ]; then
    ln -sf $(pwd)/.bash_profile ~/.bash_profile
else
    ln -sf $(pwd)/.bash_aliases ~/.bash_aliases
fi

# Link input
ln -sf $(pwd)/.inputrc ~/.inputrc

# Vim plugin manager: vim-plug
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Requires xcode and macvim
cd ~/.vim/plugged/YouCompleteMe
./install.sh --clang-completer

# Link neovim
ln -sf ~/.vim ~/.config/nvim
ln -sf ~/.vimrc ~/.config/nvim/init.vim

# Link ctags
ln -sf $(pwd)/.ctags  ~/.ctags

# Link haskeline (GHCI vi mode)
# ln -sf $(pwd)/.haskeline ~/.haskeline

# tmuxinator
gem install tmuxinator

# Set global gitignore
ln -sf $(pwd)/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
