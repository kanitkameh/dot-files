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

" Fix for shift=tab
exe 'set t_kB=' . nr2char(27) . '[Z'

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
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-surround'
Plugin 'dbakker/vim-paragraph-motion'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-commentary'
Plugin 'dyng/ctrlsf.vim'
Plugin 'vim-autoformat/vim-autoformat'
Plugin 'tommcdo/vim-exchange'
Plugin 'machakann/vim-highlightedyank'
Plugin 'AndrewRadev/yankwin.vim.git'
Plugin 'psliwka/vim-smoothie'
Plugin 'kanitkameh/glabmr.vim'
Plugin 'ziglang/zig.vim'
Plugin 'rhysd/reply.vim'
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

"YcmConfig
" If needed to add custom config for ycm(this is the path to the default one)
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py' 
let g:ycm_global_ycm_extra_conf = '~/Documents/Test/C++/ycm-global-config/.ycm_extra_conf.py'
let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }

nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gi :YcmCompleter GoToImplementation<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap K <Plug>(YCMHover)
nnoremap <leader>ca :YcmCompleter FixIt<CR>
nnoremap <leader>rn :YcmCompleter RefactorRename 

nnoremap <leader>fzf :FZF<CR>

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")

" Allow fuzzy file search in vim
set rtp+=/usr/local/opt/fzf

" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <Leader>tf :NERDTreeFind<CR>
nnoremap <Leader>tt :NERDTreeToggle<CR>

source ~/Documents/Programming/Scala/lsp-examples/vimrc.generated

"EasyMotion config
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `f{char}{label}`
"ideaVim ignore
nmap f <Plug>(easymotion-overwin-f)
"ideaVim ignore end
xmap f <Plug>(easymotion-bd-f)

nmap t <Plug>(easymotion-bd-t)
xmap t <Plug>(easymotion-bd-t)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

nnoremap <leader>/ <Plug>CtrlSFPrompt
nnoremap <leader>* <Plug>CtrlSFPrompt<C-r><C-w>
xnoremap <leader>/ <Plug>CtrlSFVwordExec

" yankwin custom maps
nnoremap <c-w>vp :call yankwin#Paste({'edit_command': 'rightbelow vertical split'})<cr>
nnoremap <c-w>vP :call yankwin#Paste({'edit_command': 'leftabove vertical split'})<cr>

helptags ALL

packadd! matchit

" reply maps
noremap <leader>rs :ReplSend<CR> 
noremap <leader>rr :ReplRecv<CR> 
noremap <leader>ro :Repl<CR> 
noremap <leader>ra :ReplAuto<CR> 
noremap <leader>rc :ReplStop<CR> 
