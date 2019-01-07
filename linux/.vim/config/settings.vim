"============== General Settings ===============
set runtimepath^=~/.vim

"let mapleader='\'
let mapleader=','
let maplocalleader = "\\"

"set nocompatible
set laststatus=2
set tabstop=2 shiftwidth=2 expandtab
set number
set relativenumber
"syntax enable
syntax on
"filetype plugin indent on

set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set dict=/usr/share/dict/words
set cursorline
set showcmd
set ruler
set incsearch
set wildmenu
set synmaxcol=0
set term=screen-256color
set display=uhex
set shortmess=aAIsT
set cmdheight=2
set nowrap
let &scrolloff=999-&scrolloff
set smartcase
set nowritebackup

set completeopt=menu
set mousemodel=popup
set backspace=2
"set backspace=indent,eol,start

set enc=utf-8
set fillchars=vert:¦

set foldcolumn=1
set cc=+1,+2

set linespace=0
set history=1000
set list listchars=tab:› ,trail:-,extends:>,precedes:<,eol:¬

set laststatus=2
set ffs=unix,dos
set mouse=a
set vb
set ttym=xterm2

set wrap

set tags=./tags

set diffopt+=vertical
set diffopt+=iwhite
if &diff
	set wrap
endif

"set showbreak=â†ª

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Backups
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undofile
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Statusline
augroup statusline
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * call RefreshStatusLine()
augroup END

" set statusline+=%=

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Make zO recursively open whatever fold we're in, even if it's partially open.
"nnoremap zO zczO
" Spelling
"
" There are three dictionaries I use for spellchecking:
"
"   /usr/share/dict/words
"   Basic stuff.
"
"   ~/.vim/custom-dictionary.utf-8.add
"   Custom words (like my name).  This is in my (version-controlled) dotfiles.
"
"   ~/.vim-local-dictionary.utf-8.add
"   More custom words.  This is *not* version controlled, so I can stick
"   work stuff in here without leaking internal names and shit.
"
" I also remap zG to add to the local dict (vanilla zG is useless anyway).
" List dics by comma eg: ./utf-8.add, ./local-dict.add, ...
set dictionary=/usr/share/dict/words
set spellfile=~/.vim/spell/rbr.utf-8.add,~/.vim-local-dictionary.utf-8.add
nnoremap zG 2zg

" EOF
