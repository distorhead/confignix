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
set noea
set mouse=a

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\<
set iminsert=0
set imsearch=0


highlight lCursor guifg=White guibg=Black
highlight Cursor  guifg=White guibg=Black
highlight PmenuSel ctermbg=Gray ctermfg=Black
highlight ColorColumn guibg=#d0d0d0 ctermbg=000

syntax on
filetype on
filetype plugin on


let mapleader = ","

nnoremap <C-W>N :vnew<CR>
map <F3> <ESC>:nohlsearch<CR>
map <F12> <ESC>:!<CR>
"Toggle cursor-at-center mode
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap <C-A>w :wall<CR>
nnoremap <C-A>q :qall<CR>
nnoremap * mw*`w
nnoremap # mw#`w
inoremap {<CR>  {<CR>}<Esc>O
nnoremap <F5> <C-W>2<
nnoremap <F6> <C-W>2>
nnoremap <F7> <C-W>2-
nnoremap <F8> <C-W>2+
"Tabulation switchers
nmap <C-T>2 :call SetupTabulation(2)<CR>
nmap <C-T>4 :call SetupTabulation(4)<CR>
nnoremap <C-K>o :FufFile **/<CR>
nnoremap <C-K>r :FufRenewCache<CR>
nnoremap <C-K>g :Ack ''<left>


if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

function! SetupTabulation(size)
  let &sts = a:size
  let &ts = a:size
  let &sw = a:size
endfunction

call SetupTabulation(2)

set tags=.tags,.gemtags,tags

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'                                                                  
Bundle 'scrooloose/nerdtree'                                                            
Bundle 'scrooloose/nerdcommenter'                                                       
Bundle 'a.vim'                                                                          
Bundle 'netrw.vim'                                                                      
Bundle 'L9'                                                                             
Bundle 'FuzzyFinder'                                                                    
Bundle 'ack.vim'
