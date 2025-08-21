set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.config/nvim/plugin/settings.vim

" disable netrw at the very start of your init.lua
lua vim.g.loaded_netrw = 1
lua vim.g.loaded_netrwPlugin = 1

" set termguicolors to enable highlight groups
lua vim.opt.termguicolors = true

lua require("config.lazy")
lua require('mappings')

