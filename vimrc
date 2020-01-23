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

" Don't wrap
set wrap!

" File Numbers:
" set numbers
set number

" show cursor position
set ruler

" Search setting
set hlsearch
set ignorecase
set smartcase
set incsearch

" Colors:
" Color scheme
colorscheme slate
" https://github.com/romainl/Apprentice
"colorscheme apprentice

" Sets the column color
set colorcolumn=88
hi ColorColumn ctermbg=black

" Spacing:
" Change tab to 2
set sts=2
set sw=2

" Expand tabs
set et

" Undo
set undodir=~/.vim/undodir
set undofile " Maintain undo history between sessions

" Set backup file
set dir=~/.vim/backup/

" Explorer
" Sets directory to be sane
let g:netrw_liststyle = 3

" Auto indent
set smartindent
set autoindent

" load indent file for the current filetype
filetype indent on

" Status Line:
" Set status line
"set statusline=
"set statusline+=%{FugitiveStatusline()}
"set statusline+=%#LineNr#
"set statusline+=\ %f

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

" Ctags
nmap <Leader>ct :!ctags -R .<CR>

" Folding:
"augroup AutoSaveFolds
"autocmd!
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
"augroup END

" Text Editing:
" Take the first spelling correction
nmap <Leader>sa :set spell! spelllang=en_us<CR>:set spell?<CR>
nmap <Leader>s 1z=

" Ruby:
" matchit do to end
runtime macros/matchit.vim
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby compiler ruby

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
" mkdir -p ~/.vim/plugin
" git clone https://github.com/mileszs/ack.vim.git ~/.vim/plugin/ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Adding FZF to vim
set rtp+=~/.fzf

" Plugins that I installed
" fzf
" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
" ~/.fzf/install
" surround
" fugitive
" repeat
" Color apprentice
