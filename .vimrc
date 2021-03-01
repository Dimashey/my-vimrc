call plug#begin('~/.vim/plugged')
Plug 'chemzqm/vim-jsx-improve'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'jiangmiao/auto-pairs'
Plug 'ycm-core/YouCompleteMe'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()

syntax on
set number
set expandtab
set tabstop=2
set hlsearch
set incsearch

set termguicolors
colorscheme one
set background=dark
set encoding=utf-8

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

map <C-n> :NERDTreeToggle<CR>
