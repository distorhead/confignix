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
"set number
set nopaste
set ai
set cin
set spelllang=ru_ru,en_us
set mouse=a
set encoding=utf-8
set fileencodings=utf8,cp1251,koi8-r
set clipboard=unnamed
set pastetoggle=<F2>
set showcmd
set visualbell

" Tabulation {
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
" } Tabulation

" Keymap {
"set keymap=russian-jcukenwin
set keymap=my-russian
set iminsert=0
set imsearch=0
" } Keymap

highlight lCursor guifg=White guibg=Black
highlight Cursor  guifg=White guibg=Black

syntax on
filetype on
filetype plugin on

let mapleader = ","

" Key mappings {
map <F5> q
map <F6> @
map <F3> <ESC>:nohlsearch<CR>
map <F12> <ESC>:!<CR>
nmap <C-V> "+gp
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y
vmap <C-X> "+d
" toggle language
imap <C-L> <C-^>
"Toggle spell check
map <C-K>s  :set spell<CR>
map <C-K>ns :set nospell<CR>
"Toggle cursor-at-center mode
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
map <C-K><C-G> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" } Key mappings

" Runtime path {
set runtimepath+=~/.vim/ultisnips_rep
" } Runtime path
