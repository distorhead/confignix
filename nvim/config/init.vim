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
highlight ColorColumn ctermbg=lightgrey guibg=#3c3836

set signcolumn=yes
highlight SignColumn ctermbg=lightgrey guibg=#3c3836


" highlight lCursor guifg=White guibg=Black
" highlight Cursor  guifg=White guibg=Black
" highlight PmenuSel ctermbg=Gray ctermfg=Black
" highlight ColorColumn guibg=#d0d0d0 ctermbg=000

set noea
set mouse=a
set expandtab

" set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\<
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
nnoremap <C-K>G :copen<CR>
nnoremap <C-K>t :tag 
nnoremap <C-K>j :CtrlPTag<CR>

" set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ "$*"
" set grepformat=%f:%l:%c:%m

highlight Search ctermfg=NONE ctermbg=LightGreen gui=NONE guibg=#add8e6 guifg=NONE

nnoremap <C-K>g :grep ''<left>
nnoremap <C-K>f mw"wyiw`w:grep '<C-R>w'<left>

"C-L is for views
nnoremap <C-L>t :NERDTreeToggle<CR>

"Copy-paste keymaps
noremap <C-T>y <C-@>
vnoremap <C-@> "wy :let @+=@w<CR>
nnoremap <C-@> "wp
nnoremap <leader>F :let @+ = expand('%:p')<CR>:echo "Copied: " . expand('%:p')<CR>


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
  use 'ivanesmantovich/xkbswitch.nvim'
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

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({ async = false, id = args.data.client_id })
      end,
    })
  end,
})

-- Helper function to organize imports via LSP code action
local function organize_imports(timeout_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local results = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms or 1000)
  if not results then return end
  for _, res in pairs(results) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(r.client_id) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      elseif r.command then
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

-- Autocommand group for Go formatting and imports
local go_fmt_grp = vim.api.nvim_create_augroup("GoFormatImports", { clear = true })

-- On save: format and organize imports
vim.api.nvim_create_autocmd("BufWritePre", {
  group = go_fmt_grp,
  pattern = "*.go",
  callback = function()
    organize_imports(1000)
    vim.lsp.buf.format({ async = false })
  end,
})

-- On leaving insert mode: format and organize imports
vim.api.nvim_create_autocmd("InsertLeave", {
  group = go_fmt_grp,
  pattern = "*.go",
  callback = function()
    organize_imports(1000)
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  end,
})

require('xkbswitch').setup()
EOF
