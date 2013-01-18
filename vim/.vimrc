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
set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\<
set iminsert=0
set imsearch=0
" } Keymap

highlight lCursor guifg=White guibg=Black
highlight Cursor  guifg=White guibg=Black
hi ColorColumn guibg=#d0d0d0 ctermbg=000

syntax on
filetype on
filetype plugin on

let mapleader = ","

" Key mappings {
map <F3> <ESC>:nohlsearch<CR>
map <F12> <ESC>:!<CR>
" schedule notifies with line
nmap <C-X>s ^"cy$:!echo 'notify-send "<C-R>c"' \| at 
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
"File ops
nmap <C-F>g :vimgrep //gj **/*<left><left><left><left><left><left><left><left>
nmap <C-F>f :new<bar>r !find ./ -iname '**'<left><left>
nmap <C-F>o :e! <cfile><CR>
" } Key mappings


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

