" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

set nocompatible            " be iMProved, required for Vundle
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" now list all the plugins
Plugin 'Lokaltog/vim-powerline'       " provides a much better status line for vim
Plugin 'scrooloose/nerdtree'          " allows you to explore your filesystem and to open files and directories
Plugin 'tpope/vim-fugitive'           " Git wrapper
Plugin 'msanders/snipmate.vim'        " prodvides code snippets for different languagues
Plugin 'tpope/vim-surround'           " all about surroundings: parentheses, brackets, quotes, xml tags and more
Plugin 'vim-scripts/TaskList.vim'     " provides list of task in the current file
Plugin 'chriskempson/base16-vim'      " different color themes for vim
Plugin 'leafgarland/typescript-vim'   " typescript syntax highlighting

" All of your plugins must be added before the following line
call vundle#end()           " required
filetype  plugin indent on  " require

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
set ruler
set laststatus=2
filetype off
set background=dark
colorscheme base16-default
syntax on
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
