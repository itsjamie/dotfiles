set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'airblade/vim-rooter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'groenewege/vim-less'
Bundle 'othree/html5.vim'
Bundle 'vim-scripts/JavaScript-Indent'
set number
set tabstop=2
set shiftwidth=2
set ai
set si
set smarttab
set expandtab
set showmatch
set smartcase
set hlsearch
set incsearch
set mouse=a
syntax enable

nnoremap t :NERDTreeToggle<CR>

set t_Co=256
set colorcolumn=80
set guifont=Inconsolata:h16

colorscheme Monokai

set filetype=on
filetype indent on

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

au BufNewFile,BufRead *.ejs set filetype=html



let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let syntastic_mode_map = { 'passive_filetypes': ['html']}

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set backspace=indent,eol,start
