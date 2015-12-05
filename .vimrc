" Plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/altercation/vim-colors-solarized'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'

Plug 'junegunn/fzf'
Plug 'scrooloose/syntastic'

Plug 'https://github.com/tmhedberg/SimpylFold.git'
Plug 'https://github.com/bling/vim-airline'

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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers=['']

" Status line
set laststatus=2
