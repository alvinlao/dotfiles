" Plugins
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-color-solarized'

Plug 'tpope/vim-surround'

Plug 'junegunn/fzf'

call plug#end()


set nocompatible

" Numbers
set nu

" Tab as spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
filetype plugin on

set autoindent

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Leader keys
let mapleader = ","

" Turn off search highlight
map <Leader>q :nohlsearch<CR>


" Colors
syntax enable
set background=dark
colorscheme solarized
