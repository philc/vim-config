"lua Pathogen for plugins.
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
set laststatus=2 " Always show the status line
set number
set undofile
set scrolloff=4 " Keep 4 lines of context when scrolling
set shortmess+=I " Remove the default splash screen when a new file is created.
set autoread " When a file is changed outside of Vim, just reload it rather than asking what to do.
set nofoldenable " I hate going into a file with parts folded.

" line wrapping
set textwidth=110
" set wrap
set nolist " List disables linebreak.
set linebreak
set colorcolumn=110 " Show a margin indicator.
" set formatoptions=qrn1
let &wrapmargin= &textwidth
set formatoptions=croql " Now it shouldn't hard-wrap long lines as you're typing (annoying), but you can gq
                        " as expected.

" Markdown
autocmd FileType markdown set formatprg=~/scripts/code/markdown_formatter.rb
" Disable the annoying display of italics which is triggered by underscores_in_words.
" http://stackoverflow.com/questions/10964681/enabling-markdown-highlighting-in-vim
" TODO(philc): For some reason this fails the first time a MD file is opened.
autocmd FileType markdown :syn clear markdownItalic

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
set nojoinspaces " When joining lines, Vim inserts two spaces if a line ends with a period. Turn that off.
noremap <Leader>j J
set clipboard=unnamed " Use the OSX clipboard, not vim's own
imap <C-d> <Del>
imap <silent> <C-e> <ESC>A
imap <silent> <C-a> <ESC>I

" Indentation in insert mode
" These keys are alt+< and alt+> on OSX. They indent the line while preserving the cursor position.
inoremap ≤ <C-d>
inoremap ≥ <C-t>

" Textmate-style invisible char markers
" note: setting list breaks the linebreak option.
" set list
" set listchars=tab:▸\ ,eol:¬

" Colorscehem
set background=dark
if &t_Co >= 256 || has("gui_running")
  " colorscheme Tomorrow-Night-Bright
  colorscheme mustang
  " Some customizations to the Mustang theme.
  hi Todo guifg=#808080 guibg=#000000 gui=italic ctermfg=244 " Don't make todos so loud.
  hi Comment gui=none " turn off italics for comments and strings.
  hi String gui=none
  hi Function gui=none " The function identification for clojure is sketchy so don't bold some and not others
endif

" Make the margin indicator more subtle than the default red.
hi ColorColumn ctermbg=darkgray guibg=#444444

" Hide the macvim toolbar
if has("gui_running")
  set guioptions=egmrt
endif

" Edit and reload vim rc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Make it easier to move around through multiline blocks of text:
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
" I'm using Spark to remap option tab to CMD+OPT+Tab, for tab switching.
noremap <A-D-Left> gT
noremap <A-D-Right> gt

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

" Resizing windows
noremap <leader>= 6<C-W>+
noremap <leader>- 6<C-W>-

" Treat .txt files as markdown. All of my .txt notes are in markdown.
au BufRead,BufNewFile *.txt set filetype=markdown
" By default Vim treats .md as modula2.
au BufRead,BufNewFile *.md set filetype=markdown
" Treat .erb as html
au BufRead,BufNewFile *.erb set filetype=html

" commenting (provided by NERDCommenter
let NERDSpaceDelims=1 " Insert one space after comment characters.
map <D-/> <plug>NERDCommenterToggle
imap <D-/> <esc><D-/>i
map <leader>/ <plug>NERDCommenterToggle

" Ctrl-P (cmd-t)
nnoremap <leader>t :CtrlP .<CR>
" Follow symlinks but ignore looped internal symlinks to avoid dupes.
let g:ctrlp_follow_symlinks = 1
" Omit class files from the listings
set wildignore+=*.class

" Nerd Tree
nmap <leader>n :NERDTreeTabsToggle<CR>
" Focuses the current file in nerd tree.
nmap <leader>f :NERDTreeFind<CR>
" These two are mapped to J and K by default. Unbind them so we can use J and K to switch tabs.
let NERDTreeMapJumpFirstChild='_'
let NERDTreeMapJumpLastChild='_'
let g:nerdtree_tabs_open_on_new_tab=0
let g:nerdtree_tabs_open_on_gui_startup=0

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
let vimclojure#WantNailgun = 1
let vimclojure#SplitSize = 16 " New popup windows have 16 lines.
let maplocalleader = ','
let vimclojure#SplitPos = "right"
" let vimclojure#NailgunClient = "/home/reformist/.vim/bin/ng"

" Correctly indent compojure and korma macros
let g:vimclojure#FuzzyIndent = 1
let g:vimclojure#FuzzyIndentPatterns = ",GET,POST,PUT,DELETE,select,insert,update,delete,fact,facts"

" Powerline
let g:Powerline_symbols = 'unicode'
" Using a customized powerline theme to remove segments, as suggested by
" http://stackoverflow.com/questions/11404863/how-to-remove-a-segment-in-vim-powerline
let g:Powerline_theme='my_powerline_theme'

" Strip trailing whitespace on save
" http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Rainbow parentheses
let g:rbpt_max = 10
let g:rbpt_colorpairs = [
    \ ['gray',      'HotPink1'],
    \ ['darkred',   'cyan1'],
    \ ['darkcyan',  'brown1'],
    \ ['darkgreen', 'yellow1'],
    \ ['darkblue',  'MediumOrchid'],
    \ ['gray',      'DeepSkyBlue1'],
    \ ['darkred',   'DarkOrange1'],
    \ ['darkcyan',  'LimeGreen'],
    \ ['darkgreen', 'goldenrod1'],
    \ ['darkblue',  'RoyalBlue1'],
    \ ]

" vim-clojure-static indentation
let g:clojure_align_multiline_strings = 0
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['with', 'def', 'let']
" let g:clojure_fuzzy_indent_patterns = "with.*,def.*,let.*"
" let g:clojure_fuzzy_indent_patterns .= ",GET,POST,PUT,PATCH,DELETE"           " Compojure
" let g:clojure_fuzzy_indent_patterns .= ",clone-for"                           " Enlive
" let g:clojure_fuzzy_indent_patterns .= ",select.*,insert.*,update.*,delete.*" " Korma
" let g:clojure_fuzzy_indent_patterns .= ",fact,facts"                          " Midje
" let g:clojure_fuzzy_indent_patterns .= ",up,down"                             " Lobos

" Activate rainbow parentheses
function! RainbowParenthesesReset()
  RainbowParenthesesToggle
  RainbowParenthesesLoadRound
  RainbowParenthesesLoadSquare
  RainbowParenthesesLoadBraces
endfunction
augroup rainbow_parentheses
  autocmd!
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
augroup end

" misc hacks
nnoremap <F2> :autocmd BufEnter handler.clj edit \| set filetype=clojure
