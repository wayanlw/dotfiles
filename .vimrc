"" Set the Leader key
let mapleader = " "

"Sets the Color Scheme
try
    colorscheme desert
    " colorscheme murphy
endtry

"" Edit vimrc configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
"" Reload vimr configuration file
nnoremap <Leader>r :source ~/.vimrc<CR>



"Disable highlight when <leader><cr> is pressed
nmap <leader>h :noh<cr>

"" map Escape and Enter
inoremap <special> jk <ESC>
inoremap <special> jj <cr>

"" use alt j and k to jump 10 lines
noremap <M-j> 10j
noremap <M-k> 10k

"" copy to the end of the line
nnoremap Y y$

"" Center the sear
"" Eg. n-go to next item | zz - center to screen | zv - expand the foldsches to the middle of the screen
"" Eg. m- mark the current location | J - bring the below line up | `z - jump to the mark back so the cursor won't jump to the end of line when J is pressed
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"" create break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u

"" Moving Text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==

"" Splits
noremap <Tab> <C-W>w
map \ <C-W>v<C-W>H<C-W><Right>
map <Bar> <C-W>s<C-W><Down>
set splitbelow "creates the new split on right
set splitright "creates the new split at bottom

" tab command shortcuts
noremap <leader><Tab> :tabn<CR>
noremap <leader>t :tabnew<CR>

"" Fast saving and quitting
nmap <leader>w :w!<cr>
nmap <leader>wq :wq!<cr>
nmap <leader>e :q!<cr>

"" system clipboard coyping pasting
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" :W sudo saves the file " (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus
set scrolloff=7 "" Set 7 lines to the cursor - when moving vertically using j/k
set ruler "" Show the line and column number of the cursor position, separated by a comma.
set whichwrap+=<,>,h,l
set hidden " A buffer becomes hidden when it is abandoned

set wildmenu "" Turn on the Wild menu
set wildchar=<TAB>  "show possible completions.
set wildmode=list:longest

set nocompatible "" make vim OK to not compatible with vi
set path+=** " activates subdirectory search. originally it searches current director

"" searching
set ignorecase "ignore the case when searching
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers

"" Timeouts
set timeoutlen=500              " how long it wait for mapped commands
set ttimeoutlen=100             " faster timeout for escape key and others

set lazyredraw "" Don't redraw while executing macros (good performance config)

"" highlight matching brackets
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets

"" Mouse settings
set mouse=a
set mousemodel=popup

" Numbering
set number
set relativenumber

"" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"" Instead of failing a command because of unsaved changes, ask to save changed files
set confirm

set foldcolumn=1 "" Add a bit extra margin to the left
set magic " For regular expressions turn magic on
set cmdheight=2 "Set the command window height to 2 lines, to avoid cases of having to press <Enter> to continue

autocmd InsertEnter,InsertLeave * set cul!  "" Enables Cursorline when in insert mode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable " Enable syntax highlighting
set ffs=unix,dos,mac " Use Unix as the standard file type
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs ;)

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters. This is visual only
set lbr
set tw=500

"" Indenting
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
let g:powerline_pycmd="py3"
set laststatus=2

"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
""let &t_SI = "\<Esc>]50;CursorShape=1\x7"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"" below function is defined since vim doesnt support block comments.
"function! _blockeomment()
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Plugin Section
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Specify a directory for plugins
    " - For Neovim: stdpath('data') . '/plugged'
    " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf'
    Plug 'scrooloose/nerdtree'
    Plug 'https://github.com/tpope/vim-surround.git'
    Plug 'https://github.com/preservim/nerdcommenter.git'
    Plug 'vim-airline/vim-airline'
    Plug 'https://github.com/easymotion/vim-easymotion.git'

    "Plug 'https://github.com/morhetz/gruvbox'
    "Plug 'https://github.com/bagrat/vim-buffet.git'
    "Plug 'https://github.com/neoclide/coc.nvim'
    "Plug 'https://github.com/junegunn/vim-github-dashboard.git'
    "Plug 'SirVer/ultisnips'
    "Plug 'honza/vim-snippets'
    "Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
    "Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
nmap <leader>n :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>f :FZF<cr>
nmap <leader>fh :FZF ~<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox activation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"endfunction
"colorscheme gruvbox
"set background=dark
