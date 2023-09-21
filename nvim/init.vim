set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua require('plugins')

" disable netrw at the very start of your init.lua
lua vim.g.loaded_netrw = 1
lua vim.g.loaded_netrwPlugin = 1

" set termguicolors to enable highlight groups
lua vim.opt.termguicolors = true

" empty setup using defaults
lua require("nvim-tree").setup()
