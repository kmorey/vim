set nocp

"let g:pathogen_disabled = ['python-mode']

call pathogen#infect()

" change the mapleader from \ to , it's important that this
" is at/near the top of the file so that other mapped comamnds
" use this leader
let mapleader=","

"Helptags
filetype off
filetype plugin indent on
syntax on

syntax enable
set background=dark
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

set encoding=utf-8
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set modeline
autocmd BufEnter * set relativenumber
set scrolloff=3
set cursorline
set ttyfast
set laststatus=2

set autoindent
set copyindent
set smartindent

set ignorecase
set smartcase

" Highlight search results as you type
set incsearch
set showmatch
set hlsearch

" global find/replace by default
set gdefault

" Manage line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

" Show commands in status bar
set showcmd

set title
set nobackup
set noswapfile

" Hides buffers instead of closing them, useful
" when opening other files and not having to save changes yet
set hidden

:command Upload :!upload.py %;

:command Wu w | Upload

" Open NERD tree if no files were specified when starting vim
autocmd vimenter * if !argc() | NERDTree | endif

" Use omnifunc for autocompletion
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal omnifunc=RopeCompleteFunc

let g:SuperTabDefaultCompletionType = "context"
set completeopt=longest,menuone,preview

" Always show status line, even for one window
set laststatus=2
" " A more informative status line
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" Toggle Nerd Tree plugin
nmap <leader>n :NERDTreeToggle<CR>

" Toggle fuzzy file/buffer search
"nmap <leader>b :CtrlP<CR>
nmap <leader>b :CtrlPMixed<CR>
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_clear_cache_on_exit = 0

nmap <leader>a <Esc>:Ack!
nmap <leader>h :GundoToggle<CR>
nmap <leader>o :TagbarOpenAutoClose<CR>
nmap <leader>s :sort<CR>

" Easily clear out search highlighting
nnoremap <leader><space> :noh<cr>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()

" Remap window movements
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set exrc
set secure

"Powerline
source $HOME/.pythonbrew/pythons/Python-2.7.3/lib/python2.7/site-packages/powerline/bindings/vim/plugin/source_plugin.vim

let g:pymode_rope_guess_project = 0
let g:pymode_rope_autoimport_modules = ["os", "json"]
let g:pymode_folding = 0
let g:pymode_rope_autoimport_generate = 0
let g:pymode_lint = 1
"let g:pymode_lint_write = 0
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_utils_whitespaces = 0
let g:pymode_breakpoint = 0
let g:pymode_lint_ignore = "E501,W404"
