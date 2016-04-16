" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
				set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
else
				" Enable per-directory .vimrc files and disable unsafe commands in them
				set exrc
				set secure
endif
" Use the Solarized Dark theme
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

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
Plugin 'L9'                           " Dependency for L9
Plugin 'leafgarland/typescript-vim'   " typescript syntax highlighting
Plugin 'Lokaltog/vim-powerline'       " provides a much better status line for vim
Plugin 'msanders/snipmate.vim'        " provides code snippets for different languages
Plugin 'pangloss/vim-javascript'      " provides list of task in the current file
Plugin 'scrooloose/nerdtree'          " allows you to explore your filesystem and to open files and directories
Plugin 'scrooloose/syntastic'         " Syntax checking
Plugin 'sjl/gundo.vim'                " Undo History Viewer
Plugin 'tpope/vim-abolish'            " Allows substitution on variants of a word
Plugin 'tpope/vim-commentary'         " Helps add comment string
Plugin 'tpope/vim-fugitive'           " Git wrapper
Plugin 'tpope/vim-surround'           " all about surroundings: parentheses, brackets, quotes, XML tags and more
Plugin 'tpope/vim-unimpaired'         " Adds new cool commands
Plugin 'Valloric/YouCompleteMe'       " Fast as-you-type, fuzzy-search code completion engine
Plugin 'vim-scripts/FuzzyFinder'      " FuzzyFinder for files
Plugin 'vim-scripts/TaskList.vim'     " provides list of task in the current file
Plugin 'docker/docker', {'rpt': '/contrib/syntax/vim/' }                " docker syntax highlighting

" All of your plug ins must be added before the following line
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

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don't add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
				set undodir=~/.vim/undo
endif

" Don't create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Enable lines numbers
set number
" Set fileformat(s) to unix
set fileformat=unix
set fileformats=unix
" Number format tip 10 from Practical Vim 2nd Edition
" makes decimal the default format
set nrformats=
" Automatically change directory to the opened file location
set autochdir
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show "invisible" characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Hightlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as patter is typed
set incsearch
" Always show the status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don't reset the cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don't show the intro message when starting vim
set shortmess=atI
" Show current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it's being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
				set relativenumber
				au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
				let save_cursor = getpos(".")
				let old_query = getreg('/')
				:%s/\s\+$//e
				call setpos('.', save_cursor)
				call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
				" Enable file type detection
				filetype on
				" Treat .json files as .js
				autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
				" Treat .md files as Markdown
				autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
" Use fold method indent
set foldmethod=indent
" Set fold level 99
set foldlevel=99
" Plugin configurations
" Gundo.vim
let g:gundo_close_on_revert=1
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command! -nargs=0 -bar Update if &modified
												\|    if empty(bufname('%'))
																\|        browse confirm write
																\|    else
																				\|        confirm write
																				\|    endif
																				\|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>
vmap <C-s> <esc>:w<CR>gv
inoremap <c-s> <c-o>:Update<CR><CR>

" Show hidden files in nerdtree
let NERDTreeShowHidden=1


" Map the window movement keys
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" Show tasklist (,td)
map <leader>td <Plug>TaskList

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

nmap <leader>f :FufFile<CR>
nmap <leader>b :FufBuffer<CR>
nmap <leader>t :FufTaggedFile<CR>
nmap <leader>nt :NERDTree<CR>

nnoremap <F5> :GundoToggle<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Save current file
nmap <C-s> :w<CR>