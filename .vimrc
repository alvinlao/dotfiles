" Plugins
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

Plug 'Valloric/YouCompleteMe'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'

Plug 'alvan/vim-closetag'

Plug 'Yggdroot/indentLine'

" JavaScript
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'https://github.com/mxw/vim-jsx'
Plug 'scrooloose/syntastic'

" CoffeeScript
Plug 'https://github.com/tmhedberg/SimpylFold.git'
Plug 'https://github.com/kchmck/vim-coffee-script.git'

" JS Languages
Plug 'https://github.com/lambdatoast/elm.vim.git'
Plug 'https://github.com/raichoo/purescript-vim'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'xolox/vim-notes'
Plug 'vim-misc'

call plug#end()

" Don't need to be compatible with vi
set nocompatible

" Colors
syntax enable
set background=dark
colorscheme solarized
" set term=screen-256color

" Rainbow Parens
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" AutoPair
let g:AutoPairsMultilineClose = 0


" Misc settings
set encoding=utf-8
set number
set relativenumber
set cursorline
set backspace=indent,eol,start
" File completion menu
set wildmenu
set wildmode=longest:list,full
" Save undos to <FILENAME>.un~
set undofile
" Search
set incsearch
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

set autoindent
set foldmethod=indent
set foldlevelstart=20
" When enabled, uses spaces in place of characters (noexpandtab)
set expandtab
" Width of a tab character
set tabstop=2
" Fine tunes the amount of whitespace to be inserted
set softtabstop=2
" Determines the amount of whitespace to insert/remove in normal mode (</>)
set shiftwidth=2

" Split
set splitbelow
set splitright

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Adds leading comment character
set formatoptions+=ro

filetype plugin on


" Use Perl/Python regex formatting, not VIM style regex
nnoremap / /\v
vnoremap / /\v

" Leader keys
let mapleader = "\<Space>"

" Turn off search highlight
nnoremap <Leader>c :nohlsearch<CR>

" Buffer Control
" To open a new empty buffer
nnoremap <Leader>T :enew<cr>
" Move to the next buffer
nnoremap <Leader>l :bnext<CR>
" Move to the previous buffer
nnoremap <Leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <Leader>q :bp <BAR> bd #<CR>
" Show all open buffers and their status
nnoremap <Leader>bl :ls<CR>



" Status line
set laststatus=2

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_html_checkers=['']
let g:syntastic_html_checkers=['']
let g:syntastic_python_python_exec='/usr/local/bin/python3'

" YouCompleteMe
autocmd CompleteDone * pclose

" CtrlP
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|env|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|un\~|swp)$',
\}
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Search for a tag in all buffers
nnoremap <silent> <Leader>t :CtrlPBufTag<cr>
nnoremap <Leader>p :CtrlPMixed<cr>
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

" vim-notes
let g:notes_directories = ['~/Dropbox/Notes']
let g:notes_suffix = '.txt'
let g:notes_smart_quotes = 0
let g:notes_conceal_code = 0
let g:notes_conceal_italic = 0
let g:notes_conceal_bold = 0
let g:notes_conceal_url = 0

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

" File specific tabbing
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType haskell setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
