set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-rooter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/vim-distinguished'

set number
set ts=2
set laststatus=2
set encoding=utf-8
set smarttab
set expandtab
set shiftwidth=2
set autoindent
set showmatch
set smartcase
set mouse=a
syntax on

set t_Co=256
set colorcolumn=80
set guifont=Inconsolata:h16

colorscheme Distinguished

filetype plugin indent on

set backspace=indent,eol,start
