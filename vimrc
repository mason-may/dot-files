"Exit kj is escape
inoremap kj <esc>

" File defaults
set enc=utf-8
set number
set wrap!
syntax on

" Search setting
set hlsearch
set ignorecase
set smartcase
set incsearch

" Color scheme
colorscheme slate 

" Change tab to 2
set sts=2
set sw=2

" Expand tabs
set et

" Explorer
" Sets directory to be sane
let g:netrw_liststyle = 3

" Auto indent
set smartindent
set autoindent

" load indent file for the current filetype
filetype indent on

" Status Line:
" Show current file name
set laststatus=2
" Display typed characters in status line
set showcmd

" Change cursor in different modes
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

" Leader key is comma
let mapleader = ","
 
" highlight the current line
set cursorline


" Built-in
filetype plugin on

" Disable bell sounds
set noerrorbells visualbell t_vb=


" set copy/paste - not needed in macvim
vmap <Leader>y :w !pbcopy<CR>
" this will do the same thing
set clipboard=unnamed

" Finding Files:

" Search down into subfolders
" Provides tab-completion for all file related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu