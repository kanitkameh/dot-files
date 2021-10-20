set nocompatible              " be iMproved, required
set encoding=utf-8 " required by youcompleteme plugin"
colorscheme torte
" detect filetypes
filetype on       
" load plugins for corresponding filetypes
filetype plugin on
" load indents for corresponding filetypes
filetype indent on 

filetype plugin indent on    " required
" Shows row number on the left
set number
" Shows the rows number relative to the current row except for the current row which is counted from the start of the file
set relativenumber
"Share clipboard with the system
set clipboard=unnamedplus 
" Color syntax highlighting
syntax on 
" Make it so that a curly brace automatically inserts an indented line
inoremap {<CR> {<CR>}<Esc>O
" Setting arrow keys to do nothing
"nnoremap <Left> <Nop>
"vnoremap <Left> <Nop>
"inoremap <Left> <Nop>
"
"nnoremap <Right> <Nop>
"vnoremap <Right> <Nop>
"inoremap <Right> <Nop>
"
"nnoremap <Up> <Nop>
"vnoremap <Up> <Nop>
"inoremap <Up> <Nop>
"
"nnoremap <Down> <Nop>
"vnoremap <Down> <Nop>
"inoremap <Down> <Nop>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'luochen1990/rainbow'
Plugin 'Raimondi/delimitMate'
Plugin 'drmikehenry/vim-headerguard'
Plugin 'scrooloose/nerdtree'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" If needed to add custom config for ycm(this is the path to the default one)
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py' 

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")

" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
