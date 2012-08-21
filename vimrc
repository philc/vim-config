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
map <Leader>j :join<CR>
set clipboard=unnamed " Use the OSX clipboard, not vim's own
imap <C-d> <Del>

" Textmate-style invisible char markers
" note: setting list breaks the linebreak option.
" set list
" set listchars=tab:▸\ ,eol:¬

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
imap <D-1> <esc><D-1>
imap <D-2> <esc><D-2>
imap <D-3> <esc><D-3>
imap <D-4> <esc><D-4>
imap <D-5> <esc><D-5>
imap <D-6> <esc><D-6>
imap <D-7> <esc><D-7>
noremap J gT
noremap K gt

" Window splits
noremap <D-d> <C-w>s
noremap <D-D> <C-w>v
noremap <D-j> <C-w>j
noremap <D-k> <C-w>k
noremap <D-h> <C-w>h
noremap <D-l> <C-w>l
imap <D-d> <esc><D-d>
imap <D-D> <esc><D-D>
imap <D-j> <esc><D-j>
imap <D-k> <esc><D-k>
imap <D-h> <esc><D-h>
imap <D-l> <esc><D-l>

" commenting (provided by NERDCommenter
let NERDSpaceDelims=1 " Insert one space after comment characters.
map <D-/> <plug>NERDCommenterToggle
imap <D-/> <esc><D-/>i
map <leader>/ <plug>NERDCommenterToggle

" Command-T
let g:CommandTMaxHeight=20
let g:CommandTMinHeight=20 " This option doesn't seem to work as of Aug 13 2012.
let g:CommandTMatchWindowAtTop=1
" <C-f> is supposed to refresh while commandT is open, but it doesn't work, so binding this manually.
nnoremap <leader>r :CommandTFlush<CR>

" Nerd Tree
nmap <leader>n :NERDTreeToggle<CR>
" These two are mapped to J and K by default. Unbind them so we can use J and K to switch tabs.
let NERDTreeMapJumpFirstChild='_'
let NERDTreeMapJumpLastChild='_'

" Show extra whitespace
hi ExtraWhitespace guibg=#666666
hi ExtraWhitespace ctermbg=7
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" VimClojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
" let vimclojure#WantNailgun = 1

" Slimv
let g:slimv_leader = ','
" Eval the most recent command.
nmap ,r :call SlimvEval([g:slimv_cmdhistory[-1]])<CR>
vmap ,r :call SlimvEval([g:slimv_cmdhistory[-1]])<CR>
let g:paredit_mode = 0 " turn this off for now.

