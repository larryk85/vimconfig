" enable true color
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" yank to clipboard
"set clipboard+=unnamedplus

" map leader to ,
let mapleader = ","

" basics
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set number
set mouse=a
set tabstop=3
set shiftwidth=3
set expandtab
set smarttab
set nocompatible
set autochdir
set autoread
set ruler
set cmdheight=2
set hid
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldcolumn=1
set ffs=unix,dos,mac
set termencoding=utf-8
set encoding=utf-8
set nobackup
set nowb
set noswapfile
set complete-=i
set signcolumn=no
set laststatus=2
set statusline=\ File:\ %{HasPaste()}%F%m%r%h\ %w\ \ \ Git:\ %{gitbranch#name()}\ \ \ \ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

syntax enable

filetype plugin on
filetype indent on

" linebreak on 500 chars
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.cpp,*.c,*.hpp,*.cc,*.cxx,*.hpp,*.h :call CleanExtraSpaces()
endif

" spell checking
set complete+=kspell
setlocal spell
setlocal spell spelllang=en_us
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" ctags
"set tags=.git/tags;/
map <silent> <leader><cr> :noh<cr>

" my helpers
map <leader>bg :ls<cr>:b<space>
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
map <space> /
map <c-space> ?
noremap <leader>to :split term://bash<CR><C-w><C-r>
"command W w !sudo tee % > /dev/null " W saves even needs sudo"
noremap <leader>' A<C-x><C-o>
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" NERDtree
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd r
"autocmd vimenter * wincmd l
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
noremap <leader>nt :NERDTreeToggle<CR>'i'

" colorscheme
set background=dark
colorscheme badwolf

" multi-cursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key = 'g<C-n>'
let g:multi_cursor_select_all_key = 'g<A-n>'
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:mutli_cursor_quit_key = '<Esc>'
