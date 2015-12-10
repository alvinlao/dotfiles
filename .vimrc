" Plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/altercation/vim-colors-solarized'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'

Plug 'scrooloose/syntastic'

Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/tmhedberg/SimpylFold.git'
Plug 'https://github.com/bling/vim-airline'
Plug 'https://github.com/kchmck/vim-coffee-script.git'
Plug 'Valloric/YouCompleteMe'

call plug#end()


set nocompatible

" Numbers
set nu

" When enabled, uses spaces in place of characters (noexpandtab)
set expandtab
" Width of a tab character
set tabstop=4
" Fine tunes the amount of whitespace to be inserted
set softtabstop=4
" Determines the amount of whitespace to insert/remove in normal mode (</>)
set shiftwidth=4

set backspace=indent,eol,start
filetype plugin on

set autoindent
set foldmethod=indent
set foldlevelstart=20

" Change tab/space
" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

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
let g:syntastic_html_checkers=['']
let g:syntastic_python_python_exec='/usr/local/bin/python3'

" Status line
set laststatus=2

" YouCompleteMe
autocmd CompleteDone * pclose

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" File specific tabbing
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
