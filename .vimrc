set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Git
Plugin 'tpope/vim-fugitive'

" General Vim improvements
Plugin 'airblade/vim-rooter'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

" Class Overviewer
Plugin 'majutsushi/tagbar'

" Snippet Engine
Plugin 'SirVer/ultisnips'

" Golang Plugin
Plugin 'fatih/vim-go'

" Customized Look
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'chrisbra/Colorizer.git'
Plugin 'vim-scripts/TagHighlight'

call vundle#end()
filetype plugin indent on

"Tabs
map <TAB> <ESC>gt<CR>
map <S-TAB> <ESC>gT<CR>

"Airline Setup
let g:airline_powerline_fonts=1

set completeopt-=preview
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
set backspace=indent,eol,start

"Golang settings
let g:go_fmt_command = "goimports"

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
