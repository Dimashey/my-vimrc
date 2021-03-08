call plug#begin('~/.vim/plugged')
Plug 'maxmellon/vim-jsx-pretty'
Plug 'xolox/vim-misc'
Plug 'chemzqm/vim-jsx-improve'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'godlygeek/tabular'
Plug 'ryanoasis/vim-devicons'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
Plug 'jiangmiao/auto-pairs'
Plug 'ycm-core/YouCompleteMe'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'dense-analysis/ale'
Plug 'kien/ctrlp.vim'
call plug#end()

syntax on
set number
set expandtab
set tabstop=2
set hlsearch
set incsearch
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set termguicolors
colorscheme one
set background=dark
set encoding=utf-8

autocmd FileType javascript nmap <buffer> gf <Plug>(enhanced-resolver-go-cursor)
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

map <C-n> :NERDTreeToggle<CR>
map <C-l> :ALEFix<CR>

" FIX ERROR 
if !executable('ctags')
    let g:gutentags_dont_load = 1
endif


" ESLINT and PRETTIER
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier'],
\   'jsx': ['stylelint', 'eslint']
\}

let g:ale_fix_on_save = 1

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

" Search Files 
"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

