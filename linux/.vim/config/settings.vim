"============== General Settings ===============
set dict=/usr/share/dict/words
set cursorline
set showcmd
set ruler
set incsearch
set wildmenu
syntax enable
set synmaxcol=0
set term=screen-256color
set display=uhex
set shortmess=aAIsT
set cmdheight=2
set nowrap
let &scrolloff=999-&scrolloff
set smartcase
set relativenumber
set nowritebackup

set completeopt=menu
set mousemodel=popup
set backspace=2
"set backspace=indent,eol,start
set number
set nocompatible

set enc=utf-8
set fillchars=vert:¦

set expandtab
set tabstop=4
set shiftwidth=4
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

set splitbelow
set splitright

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

if version > 720
	set undofile
	set undodir=~/vimundo/
endif

"let mapleader='\'
let mapleader=','

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0

let g:phpcomplete_parse_docblock_comments = 1

let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 10
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
let g:indent_guides_space_guides = 1
let g:indent_guides_guide_size = 1
"
let g:gitgutter_sign_modified = '≈ '
let g:gitgutter_sign_removed = '⌐ '

" Backups
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

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

" Somrthing for java
augroup ft_java
    au!

    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
    au FileType java inoremap <c-n> <c-x><c-]>
augroup END

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
    au FileType javascript call MakeSpacelessBufferIabbrev('clog', 'console.log();<left><left>')

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
    " }

    " Prettify a hunk of JSON with <localleader>p
    au FileType javascript nnoremap <buffer> <localleader>p ^vg_:!python -m json.tool<cr>
    au FileType javascript vnoremap <buffer> <localleader>p :!python -m json.tool<cr>
augroup END

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1

    au Filetype markdown setlocal spell

    " Linkify selected text inline to contents of pasteboard.
    au Filetype markdown vnoremap <buffer> <localleader>l <esc>`>a]<esc>`<i[<esc>`>lla()<esc>"+P

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>3 mzI###<space><esc>`zllll
    au Filetype markdown nnoremap <buffer> <localleader>4 mzI####<space><esc>`zlllll
augroup END

" Somrthing for go
augroup ft_go
    au!

    au FileType go setlocal shiftwidth=8
    au FileType go setlocal foldmethod=syntax
    au FileType go nnoremap <buffer> <silent> M :GoDoc<cr>

    " this language is incredible
    au FileType go iabbrev <buffer> ernil if err != nil {<cr>return nil, err<esc>jA}
augroup END

" EOF
