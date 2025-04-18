" General Settings
set nocompatible " This is not necessary in Neovim but can be included for consistency
set wrap
set linebreak
set nolist
set showmatch
set hlsearch
set incsearch
set ignorecase

set lazyredraw
set nopaste
set autoindent
set cindent
set spelllang=ru_ru,en_us
set encoding=utf-8
set fileencodings=utf8,cp1251,koi8-r
set clipboard=unnamed

nnoremap <F2> :set paste!<CR>
inoremap <F2> <C-O>:set paste!<CR>

set showcmd
set ruler

"set termguicolors
" set background=light
" colorscheme desert
set colorcolumn=100
" highlight ColorColumn guibg=#a0dca0
" highlight Search termfg=white termbg=blue guifg=#ffffff guibg=#0000ff
highlight ColorColumn ctermbg=lightgrey guibg=#D3D3D3

" highlight lCursor guifg=White guibg=Black
" highlight Cursor  guifg=White guibg=Black
" highlight PmenuSel ctermbg=Gray ctermfg=Black
" highlight ColorColumn guibg=#d0d0d0 ctermbg=000

set noea
set mouse=a
set expandtab

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\<
set iminsert=0
set imsearch=0

set wildmode=longest,list
set wildmenu


syntax on
filetype on
filetype plugin on

let mapleader = ","

nnoremap <C-W>N :vnew<CR>
map <F3> <ESC>:nohlsearch<CR>
map <F12> <ESC>:!<CR>
" nnoremap <C-G>g :!ctags -R -f .tags -j --languages=Go<CR><CR>
" nnoremap <C-G>T :!ctags -R -f .tags 
" nnoremap <C-G>G :!ctags -R -f $HOME/.cache/go_global_tags /usr/local/go/src $HOME/go/pkg/mod

"Toggle cursor-at-center mode
nnoremap <leader>zz :call ToggleCursorAtCenter()<CR>
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

"Golang specific searches
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
" Map 'gi' to go to implementations (interface implementations)
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>

nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>e :edit $MYVIMRC<CR>

"C-K is for searches
nnoremap <C-K>e :e **/
nnoremap <C-K>o :CtrlP<CR>
nnoremap <C-K>g :grep ''<left>
nnoremap <C-K>G :copen<CR>
nnoremap <C-K>f mw"wyiw`w:grep '<C-R>w'<left>
nnoremap <C-K>t :tag 
nnoremap <C-K>j :CtrlPTag<CR>

"C-L is for views
nnoremap <C-L>t :NERDTreeToggle<CR>
"Persistent copy-paste
noremap <C-T>y <C-@>
vnoremap <C-@> "wy :let @+=@w<CR>
nnoremap <C-@> "wp

if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd VimLeave * call system("xsel -ib", getreg('+'))
endif

function! SetupTabulation(size)
  let &sts = a:size
  let &ts = a:size
  let &sw = a:size
endfunction

function! ToggleCursorAtCenter()
  let &scrolloff=999-&scrolloff
endfunction

function! SetupBackupDir(dir)
  let &backup=1
  let &writebackup=1
  let &backupdir=a:dir
  silent execute '!mkdir -p -m 0700 ' . a:dir
endfunction

call SetupTabulation(2)
call SetupBackupDir($HOME . '/.vimbkp')

set tags=.tags,.gemtags,tags
" $HOME/.cache/go_global_tags

" Packer Configuration
lua <<EOF
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'preservim/nerdtree'
  use 'preservim/nerdcommenter'
  use 'ctrlpvim/ctrlp.vim'
  use 'doums/rg.nvim'
  use 'altercation/vim-colors-solarized'
  use 'neovim/nvim-lspconfig'
end)

require('lspconfig').gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}
EOF
