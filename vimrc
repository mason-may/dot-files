"Set no compatible
set nocompatible

"Exit kj is escape
inoremap kj <esc>

" Allow hidden buffers
set hidden

" Lazy redraw to speed up performance
set lazyredraw

" File defaults
set enc=utf-8
syntax on

" Allow more history
set history=200

" Don' wrap
set wrap!

" File numbers
set relativenumber
set number

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

" Undo
set undodir=~/.vim/undodir
set undofile " Maintain undo history between sessions

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

" Finding Files:

" Search down into subfolders
" Provides tab-completion for all file related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Ignore class files when searching
set wildignore=*.class,

" Provides tab completion like zsh
set wildmode=full
" Other options for more like bash are longest,list
" (these can both be active at once)

" Folding:
"augroup AutoSaveFolds
"autocmd!
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
"augroup END


" Ruby:
" matchit do to end
runtime macros/matchit.vim

" run the ruby tests in the current file
set makeprg=rspec\ %

" auto format file with rubocop
nmap <Leader>ra :!rubocop --safe-auto-correct %<CR>


" Functions:
" TrimWhitespace
function TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

" Plugins:
" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

