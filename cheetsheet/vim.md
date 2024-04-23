# Vim cheetsheet

This is a living document that I use to remind myself of cool things vim can do

```
" Colors
" With the latest version of Vim I've needed to add the following to a plugin
" mkdir -p ~/.vim/after/plugin/color.vim
" colorscheme PaperColor
" This will remove the colorcolumn for the current buffer
set cc=
" Tags
ctrl + ] " go to definition from ctag
ctrl + W  }	"Preview definition
ctrl + t	Jump back from definition
g]	"See all definitions

" Jumps
ctrl + o " go to previous jump
ctrl + i " go to next jump

" Indentation
=(motion) " auto indent, like indent

" Crazy cool thing things from command line
<C-o> " control o allow you to go into normal mode from insert mode

In command line
<C-f> " takes you to the command line mode for better editing

:put =strftime(\"%m-%d-%Y\") " Write the date somewhere
:read " reads the output of the command

" Completion

ctrl + p (select the thing then) control + x control + p " This will autocomplete the end of the line https://vim.fandom.com/wiki/Any_word_completion

"Remove several blank lines with one blank line
:%!cat -s

" Arg do
:args `Ack symbolize`

" Ruby
Set ruby omni completion
setlocal omnifunc=syntaxcomplete#Complete

"Diff
:diffthis  " on each pane

" Non-printable character
:set list

"Session
:mksession ~/.vim/session/<thing>.vim
:source ~/.vim/session/<thing>.vim

"Work on Quickfix list
:Ack pattern
:cdo (works just like argdo)

Look at this later
Things to look at later
filename-modifiers

" Searching
\zs	anything, sets start of match
\ze	anything, sets end of match
\v Changes to use regex using very magic

" Finding files and piping them to argsdo
find . -name "*.txt" | xargs -o vim

" Folds
" This will create a fold. You can use it with a motion or visually select lines
zf

" This will delete the fold at the cursor
zd
" This will delete all folds in the file
zE

```
