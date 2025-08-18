set encoding=utf8

" NOTE: compound maps won't work
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

set backspace=indent,eol,start

" Show incomplete commands in the corner
set showcmd 
" Highlight search
set hlsearch
" Highlight incomplete searches
set incsearch

"set spell spelllang=en_us

set noswapfile

set mouse=a

set virtualedit=block "type after end of line"

set wildmenu " display completion matches in a status line
set wildmode=list:longest,full

" detect filetypes and load plugins and indents for corresponding filetypes
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete

" Shows row number on the left
set number
" Shows the rows number relative to the current row except for the current row which is counted from the start of the file
set relativenumber
"Share clipboard with the system
set clipboard=unnamed,unnamedplus
" Color syntax highlighting
syntax on 
" use spaces in stead of tabs
set expandtab
set tabstop=4
set shiftwidth=4
'
set foldmethod=syntax
set foldlevelstart=99

set nohidden

" resize splits
nnoremap <Up>    5<C-w>-
nnoremap <Down>  5<C-w>+
nnoremap <Right>  10<C-w><
nnoremap <Left> 10<C-w>>

" move in wrapped lines when no count prefix
"ideaVim ignore
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
xnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
xnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
"ideaVim ignore end

" INSERT_MAPS:
" easier insert mode + cyrillic
inoremap jj <esc>
inoremap kj <esc>
inoremap jk <esc>
inoremap йй <esc>
inoremap кк <esc>
inoremap кй <esc>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

let mapleader="\\"

" Fix for shift=tab
exe 'set t_kB=' . nr2char(27) . '[Z'

helptags ALL

packadd! matchit

" switch to normal mode from terminal
tnoremap <Esc> <C-\><C-n>

