" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif
set number
set ruler
set laststatus=2
set nocp
filetype off
set background=dark
colorscheme base16-default
syntax on
filetype indent plugin on
set encoding=utf-8
set foldmethod=indent
set foldlevel=99

map <c-j> <c-w>j
map <c-k> <c-k>k
map <c-l> <c-l>l
map <c-h> <c-h>h
map <leader>td <Plug>TaskList

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
