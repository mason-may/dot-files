"Here are the steps for using this in your main vimrc file
"
"source ~/personal/dot-files/vimrc

"set rtp+=~/personal/tabnine-vim/

"set dir=~/.vim/backup//

" Adding FZF to vim
"set rtp+=~/.fzf

"Main:
"Set no compatible
set nocompatible

"Exit kj is escape
inoremap kj <esc>

" Change Directory to current directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

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

" Scroll to show a few lines 
set scrolloff=3
set sidescrolloff=5

" Search setting
set hlsearch
set ignorecase
set smartcase
set incsearch

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

" PlantUML:
" This is for plantuml
" Note you'll need to change where the plantuml.jar is located
nmap <Leader>um :!java -jar ~/Downloads/plantuml.jar %:p<CR>

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

" Remove double lines
function! TrimDoubleBlankLines()
  execute "%" "!" "cat -s"
endfunction

" Format file as json
"nmap <Leader>js :%!python -m json.tool<cr>
function! FormatFileAsJson()
  execute "%" "!" "python3 -m json.tool"
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
let g:fzf_layout = { 'down': '~30%' }
nmap <C-p> :FZF<cr>

" Turn off markdown
let g:polyglot_disabled = ['markdown']

" This will auto install plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"Plugins with vim-plug
call plug#begin('~/.vim/plugged')

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Surround
Plug 'tpope/vim-surround'
" Fugitive
Plug 'tpope/vim-fugitive'
" Repeat
Plug 'tpope/vim-repeat'
" Ack
Plug 'mileszs/ack.vim'
" Polygot
Plug 'sheerun/vim-polyglot'
" Tagbar
Plug 'majutsushi/tagbar'
" csv.vim
Plug 'chrisbra/csv.vim'

" NERDTree
Plug 'preservim/nerdtree'

" PaperColor
Plug 'NLKNguyen/papercolor-theme'

" Aurora
Plug 'ray-x/aurora'
call plug#end()
" Plugins that I installed
" fzf
" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
" ~/.fzf/install
" surround
" mkdir -p ~/.vim/pack/tpope/start
" cd ~/.vim/pack/tpope/start
" git clone https://tpope.io/vim/surround.git
" vim -u NONE -c "helptags surround/doc" -c q
" fugitive
" https://github.com/tpope/vim-fugitive
" repeat
" mkdir -p ~/.vim/pack/tpope/start
" cd ~/.vim/pack/tpope/start
" git clone https://tpope.io/vim/repeat.git

" Colors:
" This relies on the plugin so the plugin needs to be loaded first
" Color scheme
colorscheme PaperColor
"colorscheme slate
" This is a good color if you have a light background
" colorscheme koehler
" https://github.com/romainl/Apprentice
" colorscheme apprentice
set termguicolors            " 24 bit color
"let g:aurora_italic = 1     " italic
"let g:aurora_bold = 1     " bold

"colorscheme aurora

" Nerdtree settings
let NERDTreeShowHidden=1
nnoremap <C-n> :NERDTreeToggle<CR>

" Sets the column color
"set colorcolumn=88
"hi ColorColumn ctermbg=black
