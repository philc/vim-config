" Pathogen for plugins.
filetype off
call pathogen#infect()

set nocompatible " Use smarter defaults than Vi's.
set nobackup " Don't write out backup files.
set noswapfile
set nowritebackup
filetype plugin on

" Chrome
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden " hide buffers when opening new files, without having to save.
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set laststatus=2
" set relativenumber " Show relative line numbers.
set number
set undofile
set scrolloff=4 " Keep 4 lines of context when scrolling
set shortmess+=I " Remove the default splash screen when a new file is created.

" line wrapping
set textwidth=110
set wrap
set colorcolumn=111 " Show a margin indicator. todo this is ugly.
set formatoptions=qrn1


" Tabs
set tabstop=2 "the width hard tab characters are rendered.
set shiftwidth=2 "indent selections the same as softtabstop.
set softtabstop=2
set expandtab "Use spaces instead of tabs.

highlight Cursor guibg=LightGoldenRod guifg=LightGoldenRod
set bg=dark
syntax on

" Searching
set hlsearch
set ignorecase " ignore case when searching.
set smartcase " if you include an uppercase while searching, become case sensitive.
set incsearch " show search matches as you type.
set gdefault " Apply substitutions globally on a line.

" Make it easy to clear searches 
noremap <leader><space> :nohlsearch<cr>

" Basic editing
au FocusLost * silent! wa " Save file when focus is lost
set shiftround " use multiples of shiftwidth when indenting with <
set autoindent
set copyindent
filetype plugin indent on

" Textmate-style invisible char markers
set list
set listchars=tab:▸\ ,eol:¬

" Colorscehem
set background=dark
if &t_Co >= 256 || has("gui_running")
  colorscheme mustang
  "colorscheme twilight256
endif

" Hide the macvim toolbar
if has("gui_running")
  set guioptions=egmrt
endif

let mapleader=";"

" Edit and reload vim rc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Make it easier to move around through blocks of text:
noremap j gj
noremap k gk
noremap <C-u> 30k
noremap <C-d> 30j

" Tab is easier than % for selecting matched pairs. TODO(philc): vet
nnoremap <tab> %
vnoremap <tab> %

" leader-v to reselect pasted text, for indentation purposes etc.
nnoremap <leader>v V`

" Macvim Tabs
" Meta-N to select a tab.
noremap <D-1> 1gt
noremap <D-2> 2gt
noremap <D-3> 3gt
noremap <D-4> 4gt
noremap <D-5> 5gt
noremap <D-6> 6gt
noremap <D-7> 7gt
noremap <D-8> 8gt
noremap <D-9> 9gt
noremap J gT
noremap K gt

" Window splits
noremap <D-D> <C-W>v
noremap <D-S-D> <C-W>s
noremap <D-J> <C-W>j
noremap <D-K> <C-W>k
noremap <D-H> <C-W>h
noremap <D-L> <C-W>l

" commenting (provided by NERDCommenter
let NERDSpaceDelims=1 " Insert one space after comment characters.
map <D-/> <plug>NERDCommenterToggle
map <leader>/ <plug>NERDCommenterToggle
