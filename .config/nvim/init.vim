set number
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set cursorcolumn
set cursorline
set ruler
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set splitright
set hls
set visualbell
set ignorecase
set smartcase
set wrapscan
set showtabline=2
set noshowmode
set ruler
set incsearch
set inccommand=split
set laststatus=2
set showmode
set showcmd
set clipboard=unnamedplus
set wildmenu
set mouse=a
set nocompatible
set wildmenu

inoremap <silent> jj <ESC>

inoremap <silent> <C-h> <Left>
inoremap <silent> <C-l> <Right>
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-k> <Up>


nmap <silent> <ESC><ESC> :nohlsearch<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap j gj
nnoremap k gk

nnoremap tt :tabnew<cr>
nnoremap nh :new<cr>
nnoremap nv :vnew<cr>
nnoremap tc :tabclose<cr>
nnoremap tn :tabn<cr>
nnoremap tp :tabp<cr>

" ctl-h replace
nnoremap <C-h> :%s///gc

nnoremap <silent> sh :split<cr>
nnoremap <silent> sv :vsplit<cr>

let mapleader = "\<Space>"

 nnoremap <silent> <Leader>fd :Defx<CR>

" add name and save file
nnoremap <Leader>s :save 


" Leader+w + hjklでウィンドウ間を移動
nmap <Leader>w [window]
nnoremap [window]h <C-w>h
nnoremap [window]j <C-w>j
nnoremap [window]k <C-w>k
nnoremap [window]l <C-w>l

" カーソル移動を早く
nnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <Leader>j }
nnoremap <Leader>k {
nnoremap <Leader>m %

" Shift + 矢印でウィンドウサイズを変更
nnoremap <s-left> <c-w><<cr>
nnoremap <s-right> <c-w>><cr>
nnoremap <s-up> <c-w>-<cr>
nnoremap <s-down> <c-w>+<cr>

" shift+vで一行まるごとハイライト
vnoremap v $h

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let s:toml_dir = expand('~/.config/nvim/plugins')
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

