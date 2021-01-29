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
set laststatus=2
set showmode
set showcmd

inoremap <silent> jj <ESC>

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
nnoremap tc :tabclose<cr>
nnoremap tn :tabn<cr>
nnoremap tp :tabN<cr>
nnoremap nh :new<cr>
nnoremap nv :vnew<cr>

nnoremap <silent> sh :split<cr>
nnoremap <silent> sv :vsplit<cr>

let mapleader = "\<Space>"

" ファイルマネージャー起動
nnoremap <silent> <Leader>f :<c-u>Defx<cr>

nnoremap <Leader>s :w<CR>
nnoremap <Leader>ss :save

" Leader + hjklでウィンドウ間を移動
nmap <Leader>w [window]
nnoremap [window]h <C-w>h
nnoremap [window]j <C-w>j
nnoremap [window]k <C-w>k
nnoremap [window]l <C-w>l
"nnoremap <c-h> <c-w>h
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
"nnoremap <c-l> <c-w>l

" カーソル移動を早く
nnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <Leader>j }
nnoremap <Leader>k {

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

colorscheme gruvbox
" colorscheme vimtom
" colorscheme onedark

if dein#check_install()
  call dein#install()
endif

