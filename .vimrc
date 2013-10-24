set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle "gmarik/vundle"

Bundle "pangloss/vim-javascript"
Bundle "groenewege/vim-less"
Bundle "tpope/vim-fugitive"
Bundle "gregsexton/gitv"

" General Vim improvements
Bundle "scrooloose/nerdtree"
Bundle "jistr/vim-nerdtree-tabs"
Bundle "airblade/vim-rooter"
Bundle "kien/ctrlp.vim"
Bundle "tpope/vim-surround"

" Customized Look
Bundle "bling/vim-airline"
Bundle "Lokaltog/vim-distinguished"
Bundle "chrisbra/color_highlight.git"
Bundle "vim-scripts/TagHighlight"

"Tabs
map <TAB> <ESC>gt<CR>
map <S-TAB> <ESC>gT<CR>

"Gitv Setup
let g:Gitv_OpenHorizontal="auto"

"NerdTree Setup
nnoremap <silent> <S-t> <ESC>:NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"Airline Setup
let g:airline_powerline_fonts=1

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
