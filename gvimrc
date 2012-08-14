set guifont=Menlo\ Regular:h18

" Unmap some of macvim's CMD bindings.
if has("gui_macvim")
  " macmenu &File.New\ Tab key=<nop>
  macmenu &Tools.List\ Errors key=<nop>
  map <D-t> :CommandT<CR>
  map <D-l> :CommandT<CR>
endif

" Window splits
noremap <D-D> <C-W>v
noremap <D-S-D> <C-W>s
noremap <D-J> <C-W>j
noremap <D-K> <C-W>k
noremap <D-H> <C-W>h
noremap <D-L> <C-W>l


