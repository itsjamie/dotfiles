call plug#begin('~/.config/nvim/plugged')
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim' | Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make'}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" filetype plugins
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'fatih/vim-nginx' , {'for' : 'nginx'}
Plug 'corylanou/vim-present', {'for' : 'present'}
call plug#end()


" Document the defaults in nvim, and if we use this config in vim, they'll be set
if !has('nvim')
  set nocompatible
  filetype off
  filetype plugin indent on
  set ttyfast
  set ttymouse=xterm2
  set ttyscroll=3
  set autoindent
  set autoread
  set backspace=indent,eol,start
  set complete=.,w,b,u,t
  set display=lastline
  set encoding=utf-8
  set formatoptions=tcqj
  set history=10000
  set hlsearch
  set incsearch
  set langnoremap
  set laststatus=2
  set listchars=tab:> ,trail:-,nbsp:+
  set mouse=a
  set nrformats=bin,hex
  set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
  set smarttab
  set tabpagemux=50
  set tags=./tags;,tags
  set viminfo=!,'100,<50,s10,h
  set wildmenu
endif

set noerrorbells
set showcmd
set noswapfile
set nobackup
set splitright
set splitbelow
set autowrite
set hidden
set fileformats=unix,dos,mac
set noshowmatch
set nocursorcolumn " speed up syntax highlighting
set nocursorline
set noshowmode " show the mode with statusplugin
set ignorecase " Search case insensitive ...
set smartcase " ... but not if it begins with upper case
set completeopt=menu,menuone
set pumheight=10 " completion window max size
set clipboard^=unnamed
set clipboard^=unnamedplus
set lazyredraw
syntax sync minlines=256
set synmaxcol=300
set re=1
set ts=2
set sw=2
set completeopt-=preview
set relativenumber
set guifont=Source\ Code\ Pro\ Light\ for\ Powerline:h12
let g:rehash256 = 1
set background=dark
colorscheme molokai

autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.vim setlocal noet ts=2 sw=2 sts=2
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2

nnoremap <silent> <F5> :source $MYVIMRC<CR>

" Open goto symbol on current buffer
nmap <M-r> :MyCtrlPTag<cr>
imap <M-r> <esc>:MyCtrlPTag<cr>

" Open goto symbol on all buffers
nmap <M-R> :CtrlPBufTagAll<cr>
imap <M-R> <esc>:CtrlPBufTagAll<cr>

" Open basic CtrlP
nmap <M-t> :CtrlP<cr>
imap <M-t> <esc>:CtrlP<cr>



" DEOPLETE SETUP
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file']
let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']

  " Use partial fuzzy matches like YouCompleteMe
  call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

" NERDTREE SETUP
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

" VIM-JSON SETUP
let g:vim_json_syntax_conceal = 0
