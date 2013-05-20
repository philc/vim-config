"Pathogen for plugins.
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

" Line wrapping
set textwidth=110
" Set wrap
set nolist " List disables linebreak.
set linebreak
set colorcolumn=110 " Show a margin indicator.
set formatoptions=croql " Now it shouldn't hard-wrap long lines as you're typing (annoying), but you can gq
                        " as expected.
" Indent lines after pasting them. Important for when you paste a line inside an if block and it's not
" indented properly inside the if. If this has bad edge cases, try https://github.com/sickill/vim-pasta
nnoremap p p`[v`]=

" Tabs
set tabstop=2 "the width hard tab characters are rendered.
set shiftwidth=2 "indent selections the same as softtabstop.
set softtabstop=2
set expandtab "Use spaces instead of tabs.

highlight Cursor guibg=LightGoldenRod guifg=LightGoldenRod
set bg=dark
syntax on
set synmaxcol=200 " Don't syntax highlight super long lines. It makes Vim scrolling very sluggish.

" Searching
set hlsearch
set ignorecase " ignore case when searching.
set smartcase " if you include an uppercase while searching, become case sensitive.
set incsearch " show search matches as you type.
set gdefault " Apply substitutions globally on a line.

" Spellcheck
set spell " My custom spellfile is in ~/.vim/spell/en.utf-8.add
" This function ignores URLs and file paths when spellchecking. Note that some file types set `syntax spell
" toplevel` and must be treated differently than other groups.
" - http://stackoverflow.com/questions/7561603/vim-spell-check-ignore-capitalized-words
fun! SetupSpellCheckIgnoreRules()
  if (&filetype=='markdown')
    syn case match
    syn match spellcheckURL /\<http[^ ]\+/
    syn match spellcheckFilepath / \/.*\>/
    syn match spellcheckCamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/
    syn case ignore
  else
    syn match spellcheckURL /\<http[^ ]\+/ contains=@NoSpell transparent
    syn match spellcheckFilepath / \/.*\>/ contains=@NoSpell transparent
    syn match spellcheckCamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
    syn cluster Spell add=spellcheckURL
    syn cluster Spell add=spellcheckFilepath
    syn cluster Spell add=spellcheckCamelCase
  endif
endfun

let mapleader=";"

" Make it easy to clear searches
noremap <leader><space> :nohlsearch<cr>

call SetupSpellCheckIgnoreRules()
" Basic editing
autocmd FocusLost * silent! wa " Save file when focus is lost
set shiftround " use multiples of shiftwidth when indenting with <
set autoindent
set copyindent
filetype plugin indent on
set nojoinspaces " When joining lines, Vim inserts two spaces if a line ends with a period. Turn that off.
" These are later remapped to move between tabs.
noremap <Leader>j J
noremap <Leader>k K
set clipboard=unnamed " Use the OSX clipboard, not vim's own
" Emacs-style bindings in insert mode.
imap <C-d> <Del>
imap <silent> <C-e> <ESC>A
imap <silent> <C-a> <ESC>I

" Reformat paragraph. I do this very commonly, so this is a shortcut.
noremap <Leader>q gqap
" Remove hard line breaks so we can paste into emails or other soft-wrap formats. w for "wrap".
" Since we're using a script as our text formatter, pass the line length via an env var. `` restores cursor.
" We not using a substitution as in stackoverflow.com/q/2880109 so that we can preserve list formatting in md.
noremap <leader>wap :let $LINE_LENGTH=10000<CR>gqap``<CR>:let $LINE_LENGTH=&textwidth<CR>
noremap <leader>wG :let $LINE_LENGTH=10000<CR>Ggqgg``<CR>:let $LINE_LENGTH=&textwidth<CR>

" Indentation in insert mode
" These keys are alt+< and alt+> on OSX. They indent the line while preserving the cursor position.
inoremap ≤ <C-d>
inoremap ≥ <C-t>

" q{motion} begins a macro. I often hit q to exit Fireplace's outputs, and accidentally start recording
" a macro. Disable macro recording for now.
noremap q <esc>

" Edit and reload vim rc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC \| :call RainbowParenthesesReset()<CR>
" nmap <silent> <leader>sv :so $MYVIMRC<CR>

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
" J is join lines and K is look up in docs/man. I remap those to <leader>J and K.
noremap J gT
noremap K gt
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

" Markdown
" Treat .txt files as markdown. All of my .txt notes are in markdown.
let $LINE_LENGTH=&textwidth
augroup markdown_philc
  autocmd!
  autocmd BufRead,BufNewFile *.txt set filetype=markdown
  " By default Vim treats .md as modula2.
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  " Disable the annoying display of italics which is triggered by underscores_in_words.
  " http://stackoverflow.com/questions/10964681/enabling-markdown-highlighting-in-vim
  autocmd FileType markdown :syn clear markdownItalic
  autocmd FileType markdown exec 'set formatprg=~/scripts/code/markdown_formatter.rb'
augroup end
" Render a markdown preview in a browser.
nnoremap <LEADER>M :%w ! markdown_doctor \| bcat<CR><CR>

" commenting (provided by NERDCommenter
let NERDSpaceDelims=1 " Insert one space after comment characters.
map <D-/> <plug>NERDCommenterToggle
imap <D-/> <esc><D-/>i
map <leader>/ <plug>NERDCommenterToggle

" Ctrl-P (cmd-t)
nnoremap <leader>t :CtrlP .<CR>
" Follow symlinks but ignore looped internal symlinks to avoid dupes.
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '/public/assets/*',
  \ }
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

" Fireplace
" Remap shift-k to leader k. I use shift-k for tab switching.
augroup fireplace_philc
  autocmd!
  autocmd BufEnter *.clj nmap <buffer> K gt
  autocmd BufEnter *.clj nmap <buffer> <leader>k <Plug>FireplaceK
augroup end

" Powerline
let g:Powerline_symbols = 'unicode'
" Using a customized powerline theme to remove segments, as suggested by
" http://stackoverflow.com/questions/11404863/how-to-remove-a-segment-in-vim-powerline
let g:Powerline_theme='my_powerline_theme'

" Rainbow parentheses
let g:rbpt_max = 10
let g:rbpt_colorpairs = [
    \ ['gray',      'HotPink1'],
    \ ['darkred',   'cyan1'],
    \ ['darkcyan',  'RoyalBlue1'],
    \ ['darkgreen', 'yellow1'],
    \ ['darkblue',  'MediumOrchid'],
    \ ['gray',      'DeepSkyBlue1'],
    \ ['darkred',   'DarkOrange1'],
    \ ['darkcyan',  'LimeGreen'],
    \ ['darkgreen', 'goldenrod1'],
    \ ['darkblue',  'brown1'],
    \ ]

function! RainbowParenthesesReset()
  RainbowParenthesesActivate
  RainbowParenthesesLoadRound
  RainbowParenthesesLoadBraces
endfunction

augroup rainbow_parentheses_philc
  autocmd!
  autocmd Filetype clojure RainbowParenthesesActivate
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadBraces
augroup end

" vim-clojure-static indentation
let g:clojure_align_multiline_strings = 0
let g:clojure_fuzzy_indent = 1
" let g:clojure_fuzzy_indent_patterns = ['with', 'def', 'let']
let g:clojure_fuzzy_indent_patterns = "with.*,def.*,let.*,send.*"
let g:clojure_fuzzy_indent_patterns .= ",cli.*" " Clojure core
let g:clojure_fuzzy_indent_patterns .= ",GET,POST,PUT,PATCH,DELETE,context"           " Compojure
let g:clojure_fuzzy_indent_patterns .= ",clone-for"                           " Enlive
let g:clojure_fuzzy_indent_patterns .= ",select.*,insert.*,update.*,delete.*,with.*" " Korma
let g:clojure_fuzzy_indent_patterns .= ",fact,facts"                          " Midje
let g:clojure_fuzzy_indent_patterns .= ",up,down"                             " Lobos
let g:clojure_fuzzy_indent_patterns .= ",when-eiligible,with-eligible-values "

" Misc File types.
augroup misc_filetypes
  autocmd!
  autocmd BufNewFile,BufRead Guardfile,.Guardfile,Vagrantfile set filetype=ruby
  " Treat .erb as html
  autocmd BufRead,BufNewFile *.erb set filetype=html
augroup end

" Colorscheme
set background=dark
if &t_Co >= 256 || has("gui_running")
  " colorscheme Tomorrow-Night-Bright
  colorscheme mustang
  " Some customizations to the Mustang theme.
  hi Todo guifg=#808080 guibg=#000000 gui=italic ctermfg=244 " Don't make todos so loud.
  " So gitgutter looks nicer.
  hi SignColumn guibg=black
  hi Comment gui=none " turn off italics for comments and strings.
  hi String gui=none
  hi Function gui=none " The function identification for clojure is sketchy so don't bold some and not others
endif

" Make the margin indicator more subtle than the default red.
hi ColorColumn ctermbg=darkgray guibg=#444444

" Show extra whitespace
hi ExtraWhitespace guibg=#664444
hi ExtraWhitespace ctermbg=7

" Strip trailing whitespace on save
" http://stackoverflow.com/q/356126
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

match ExtraWhitespace /\s\+$/
augroup trailing_whitespace
  autocmd!
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup end

augroup spelling_group
  autocmd!
  " Don't highlight URLs and file paths in spellcheck.
  autocmd BufRead,BufNewFile * :call SetupSpellCheckIgnoreRules()
augroup end

" Hide the macvim toolbar
if has("gui_running")
  set guioptions=egmrt
endif

" misc hacks
nnoremap <F2> :autocmd BufEnter handler.clj edit \| set filetype=clojure
