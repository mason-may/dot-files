#!/bin/bash


# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# backup dir

mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undodir
