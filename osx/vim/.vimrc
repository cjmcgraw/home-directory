""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author:   Carl McGraw
" Date:     12/04/15
" Version:  1.0
"
" Table of Contents:
"   => Configuration Files
"   => General
"   => VIM User Interface Configurations
"   => Colors and Fonts
"   => Files, backups and Swaps
"   => Text, tabs and spaces
"   => Visual mode configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load configration files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load vundle configurations
if filereadable($VIM_CONFIG_FILES . "/Vundle/vundlerc")
    source "${VIM_CONFIG_FILES}/Vundle/vundlerc"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Confirm encoding
set encoding=utf-8

" Sets how many lines for vim to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set auto read when file is changed externally
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set clipboard
" OSX
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM User Interface Configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Adjust vertical line spacing
set so=7

" Configure backspace to operate as expected
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore cases when searching
set ignorecase

" Set up smart case search
set smartcase

" Highlight search results
set hlsearch

" Set up incremental search
set incsearch 

" Regular expression magic
set magic

" Show matching brackets when indicator is over them
set showmatch

" Display line numbers
set nu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set up colorscheme
colorscheme desert
set background=dark

" Set extra options for gui
if has("gui_running")
	set guioptions-=T
	set guioptions+=e
	set t_Co=256
endif

" Set UTF-8 as standard encoding
set encoding=UTF-8

" Use unix as default file type
set ffs=unix

"
let python_highlight_all=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and swaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off backups
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab, and spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Set up smart tabs
set smarttab

" Set up default tab to spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 80 characters
set lbr
set tw=80

" Indentation settings
set autoindent
set smartindent

" Set line wrap settings
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When in Visual Mode you may press '#' or '*' to search for the selected
" text in the file.
vnoremap <silent> # :call VisualSelection('b')<CR>
vnoremap <silent> * :call VisualSelection('f')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" More intuitive window changing
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
