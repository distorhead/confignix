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
set ruler
set colorcolumn=88

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
" schedule notifies with line
nmap <C-X>s ^"cy$:!echo 'notify-send "<C-R>c"' \| at 
" toggle language
imap <C-L> <C-^>
"Toggle spell check
map <C-K>s  :set spell<CR>
map <C-K>ns :set nospell<CR>
"Toggle cursor-at-center mode
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap <C-A>w :wall<CR>
nnoremap <C-A>q :qall<CR>
nnoremap * mw*`w
nnoremap # mw#`w
inoremap {<CR>  {<CR>}<Esc>O
" } Key mappings

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

