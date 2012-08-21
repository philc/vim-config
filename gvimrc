set guifont=Menlo\ Regular:h18

" Unmap some of macvim's CMD bindings.
if has("gui_macvim")
  " macmenu &File.New\ Tab key=<nop>
  macmenu &Tools.List\ Errors key=<nop>
  map <D-t> :CommandT<CR>
  map <D-l> :CommandT<CR>
endif

" Window splits
noremap <D-j> <C-w>j
noremap <D-k> <C-w>k
noremap <D-h> <C-w>h
noremap <D-l> <C-w>l
imap <D-j> <esc><D-j>
imap <D-k> <esc><D-k>
imap <D-h> <esc><D-h>
imap <D-l> <esc><D-l>




