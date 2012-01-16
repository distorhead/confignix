set nocompatible
set wrap
set linebreak
set nolist

set showmatch
set hlsearch
set incsearch
set ignorecase

set nobackup
set nowritebackup

set lz

set number

" Tabulation settings {
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

"syntax match Tab /\t/
"hi Tab gui=underline guifg=blue ctermbg=blue
" } Tabulation settings

colorscheme desert

set nopaste

set ai
set cin

" set keymap=russian-jcukenwin
set keymap=my-russian
set iminsert=0
set imsearch=0

highlight lCursor guifg=White guibg=Black
highlight Cursor  guifg=White guibg=Black

set nocp
filetype on
filetype plugin on

syntax on

set spelllang=ru_ru,en_us
set mouse=a
set encoding=utf-8
set fileencodings=utf8,cp1251,koi8-r
set clipboard=unnamed
set pastetoggle=<F2>

let mapleader = ","

" Key mappings {
map <F5> q
map <F6> @
map <F3> <ESC>:nohlsearch<CR>
map <F12> <ESC>:!<CR>
nmap <C-V> "+gp
imap <C-V> <ESC><C-V>a
vmap <C-C> "+y
vmap <C-X> "+d

" toggle language
imap <C-L> <C-^>

"Toggle spell check
map <C-K>s  :set spell<CR>
map <C-K>ns :set nospell<CR>

"Toggle cursor-at-center mode
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
" } Key mappings

set runtimepath+=~/.vim/ultisnips_rep
