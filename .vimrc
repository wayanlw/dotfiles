" Numbering 
set number "display line numbers
set relativenumber "display relative line numbers
set ruler "show the ruler in the line   
set ignorecase "ignore the case when searching 
set hlsearch
set incsearch
set mouse=a
set cursorline

set showmatch
set mat=2

set expandtab " Use spaces instead of tabs
set smarttab 

"1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


syntax enable
"Disable highlight when <leader><cr> is pressed
nmap <silent> <leader><cr> :noh<cr>

	"let mapleader = ","

"map i <Up>
"map j <Left>
"map k <Down>
"noremap h i

"Two semicolons are easy to type.
imap jk <Esc>

"powerline for vim
let g:powerline_pycmd="py3"
set laststatus=2

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
