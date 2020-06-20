set nocompatible " be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" All plugins start getting put in here

" Vundle stuff
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Gavin's original stuffs
"set rtp+=/usr/local/go/misc/vim
set number
set cursorline
colorscheme molokai
"filetype plugin indent on
syntax on
