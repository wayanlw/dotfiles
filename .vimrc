set number
set relativenumber
set ruler
set ignorecase
set hlsearch
set incsearch
set mouse=a
set cusorline

set showmatch
set mat=2

set expandtab " Use spaces instead of tabs
set smarttab 

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


syntax enable
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

	"let mapleader = ","

"map i <Up>
"map j <Left>
"map k <Down>
"noremap h i

" Two semicolons are easy to type.
imap jk <Esc>
