
scriptencoding utf-8
set encoding=utf-8

set number
set autoindent
set smartindent

set tabstop=2
set shiftwidth=2
set expandtab

set hls
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set cursorline
set cursorcolumn
set visualbell
set showmatch
set matchtime=1
set laststatus=2


nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Esc><Esc> :noh<CR>

inoremap <silent> jj <Esc>

set ignorecase
set smartcase
set wrapscan

"colorscheme kalisi
colorscheme gruvbox 
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy':0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy':1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable

