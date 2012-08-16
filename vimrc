" Pathogen for plugins.
filetype off
call pathogen#infect()

set nocompatible " Use smarter defaults than Vi's.
set nobackup " Don't write out backup files.
set noswapfile
set nowritebackup
set undodir=~/.vim/tmp/undo/ " store persistent undo files here.
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
" set wrap
set nolist " List disables linebreak.
set linebreak " Wrap lines on whitespace, not in the middle of words.
"set colorcolumn=111 " Show a margin indicator. todo this is ugly.
" set formatoptions=qrn1
let &wrapmargin= &textwidth
set formatoptions=croql " Now it shouldn't hard-wrap long lines as you're typing (annoying), but you can gq
                        " as expected.
"set formatoptions+=t " Wrap text at 110 chars (textwidth) instead of the terminal's edge.

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

let mapleader=";"

" Make it easy to clear searches
noremap <leader><space> :nohlsearch<cr>

" Basic editing
au FocusLost * silent! wa " Save file when focus is lost
set shiftround " use multiples of shiftwidth when indenting with <
set autoindent
set copyindent
filetype plugin indent on
map <C-J> :join!

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

" Edit and reload vim rc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Make it easier to move around through blocks of text:
noremap j gj
noremap k gk
noremap <C-u> 10k
noremap <C-d> 10j
noremap <C-J> 40j
noremap <C-K> 40k

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
nnoremap J gT
nnoremap K gt

" Window splits
noremap <D-d> <C-W>v
noremap <D-D> <C-W>s
noremap <D-j> <C-W>j
noremap <D-k> <C-W>k
noremap <D-h> <C-W>h
noremap <D-l> <C-W>l

" commenting (provided by NERDCommenter
let NERDSpaceDelims=1 " Insert one space after comment characters.
map <D-/> <plug>NERDCommenterToggle
map <leader>/ <plug>NERDCommenterToggle

" Command-T
let g:CommandTMaxHeight=20
let g:CommandTMinHeight=20 " This option doesn't seem to work as of Aug 13 2012.
let g:CommandTMatchWindowAtTop=1

" Nerd Tree
nmap <leader>n :NERDTreeToggle<CR>
