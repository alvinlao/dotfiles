" Plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/altercation/vim-colors-solarized'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'

Plug 'junegunn/fzf'
Plug 'scrooloose/syntastic'

Plug 'https://github.com/tmhedberg/SimpylFold.git'

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
set foldmethod=indent
set foldlevelstart=20

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Leader keys
let mapleader = ","

" Turn off search highlight
map <Leader>q :nohlsearch<CR>
map <Leader>t :FZF<CR>


" Colors
syntax enable
set background=dark
colorscheme solarized
