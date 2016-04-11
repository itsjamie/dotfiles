call plug#begin('~/.config/plugged')
" ColorScheme of choice
Plug 'tomasr/molokai'

" Add IDE-like features
Plug 'fatih/vim-go'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" filetype plugins
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'fatih/vim-nginx' , {'for' : 'nginx'}
Plug 'corylanou/vim-present', {'for' : 'present'}

"Plugins that change if in neovim or in vim
if has('nvim')
	Plug 'Shougo/deoplete.nvim' | Plug 'zchee/deoplete-go', { 'do': 'make' }
else
	Plug 'Shougo/neocomplete.vim'
endif

call plug#end()
" Plug 'garyburd/go-explorer', { 'for': 'go', 'do': 'go get github.com/garyburd/go-explorer/src/getool' }

"Document the defaults in nvim, and if we use this config in vim, they'll be set
if !has('nvim')
  set nocompatible
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
  set listchars=tab:»·,trail:·,nbsp:·
  set mouse=a
  set nrformats=bin,hex
  set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
  set smarttab
  set tags=./tags;,tags
  set viminfo=!,'100,<50,s10,h
  set wildmenu
	
	set t_Co=256

	filetype plugin indent on
	let g:neocomplete#data_directory = "~/.cache/neocomplete"
	let g:neocomplete#enable_at_startup = 1
else
	" DEOPLETE SETUP
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#ignore_sources = {}
	let g:deoplete#ignore_sources.go = ['buffer', 'member', 'tag', 'file']
	let g:deoplete#sources#go#align_class = 1
	let g:deoplete#sources#go#package_dot = 1

	" Use partial fuzzy matches like YouCompleteMe
	call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
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
set pumheight=10 " completion window max size
set clipboard^=unnamed
set clipboard^=unnamedplus
set lazyredraw
syntax sync minlines=256
set synmaxcol=300
set re=1
set ts=2
set sw=2
set cmdheight=2
set completeopt+=menuone
set completeopt-=preview
set relativenumber
set number
set guifont=Source\ Code\ Pro\ Light\ for\ Powerline:h12
let g:rehash256 = 1
syntax on 
colorscheme molokai
set background=dark

autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.vim setlocal noet ts=2 sw=2 sts=2
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2

let mapleader = ","
let g:mapleader = ","

" Open goto symbol on current buffer
nmap <Leader>r :GoDecls<cr>
imap <Leader>r <esc>:GoDecls<cr>

" Open goto symbol on all buffers
nmap <Leader>R :GoDeclsDir<cr>
imap <Leader>R <esc>:GoDeclsDir<cr>

" Open basic CtrlP
nmap <Leader>p :CtrlP<cr>
imap <Leader>p <esc>:CtrlP<cr>

" CtrlP setup
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" NERDTREE SETUP
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
let NERDTreeShowHidden=1

" vim-go
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_term_enabled = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_build_constraints = 1

" VIM-JSON SETUP
let g:vim_json_syntax_conceal = 0

" Lightline setup
let g:lightline = {
  \ 	'active': {
  \ 		'left': [['mode', 'paste'], ['fugitive', 'filename', 'modified', 'ctrlpmark'], ['go']],
  \		'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']],
  \ 	},
  \	'inactive': {
  \		'left': [['go']],
  \	},
  \	'component_function': {
  \		'lineinfo': 'LightlineInfo',
  \		'percent': 'LightlinePercent',
  \		'modified': 'LightlineModified',
  \		'filename': 'LightlineFilename',
  \		'go': 'LightLineGo',
  \		'fileformat': 'LightLineFileformat',
  \		'filetype': 'LightLineFiletype',
  \		'fileencoding': 'LightLineFileencoding',
  \		'mode': 'LightLineMode',
  \		'fugitive': 'LightLineFugitive',
  \		'ctrlpmark': 'CtrlPMark',
  \	},
  \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineInfo()
  return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightLinePercent()
  return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineGo()
  " return ''
  return exists('*go#jobcontrol#Statusline') ? go#jobcontrol#Statusline() : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  if mode() == 't'
    return ''
  endif

  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction
