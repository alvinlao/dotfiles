" Plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/altercation/vim-colors-solarized'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'
Plug 'alvan/vim-closetag'

Plug 'scrooloose/syntastic'

Plug 'https://github.com/tmhedberg/SimpylFold.git'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/kchmck/vim-coffee-script.git'
Plug 'Valloric/YouCompleteMe'
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'https://github.com/mxw/vim-jsx'

Plug 'https://github.com/lambdatoast/elm.vim.git'


call plug#end()

" Don't need to be compatible with vi
set nocompatible

" Leader keys
let mapleader = "\<Space>"

" Numbers
set nu
set relativenumber

set encoding=utf-8
set cursorline

" File completion menu
set wildmenu
set wildmode=longest:list,full

" Save undos to <FILENAME>.un~
set undofile

" When enabled, uses spaces in place of characters (noexpandtab)
set expandtab
" Width of a tab character
set tabstop=2
" Fine tunes the amount of whitespace to be inserted
set softtabstop=2
" Determines the amount of whitespace to insert/remove in normal mode (</>)
set shiftwidth=2

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
set incsearch
set showmatch

" Use Perl/Python regex formatting, not VIM style regex
nnoremap / /\v
vnoremap / /\v

" Turn off search highlight
map <Leader>c :nohlsearch<CR>

" Close current buffer
nnoremap <Leader>q :bd<CR>

" Colors
syntax enable
set background=dark
colorscheme solarized
set term=screen-256color

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['jsxhint']
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
" Search for a tag in all buffers
nnoremap <silent> <Leader>t :CtrlPBufTag<cr>
nnoremap <Leader>p :CtrlPBuffer<cr>
let g:ctrlp_show_hidden = 1

" vim-closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" Prevent vim-json from hiding quotes
let g:vim_json_syntax_conceal = 0

" vim-jsx
let g:jsx_ext_required = 0

" Coffee script
" Enable folding by indentation
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent

" File specific tabbing
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType haskell setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
