"
"
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following are examples of different formats supported.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"-------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

" Keep Plugin commands between vundle#begin/end.
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Utility
" NERDTree is a file system explorer for the Vim editor
Plugin 'scrooloose/nerdtree'

" Lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline'

" Syntastic is a syntax checking plugin for Vim created by Martin Grenfell. It
" runs files through external syntax checkers and displays any resulting
" errors to the user
Plugin 'vim-syntastic/syntastic'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'kien/ctrlp.vim'

" It's an interactive Unix filter for command-line that can be used with any
" list; files, command history, processes, hostnames, bookmarks, git commits,
" etc
"Plugin 'junegunn/fzf'

" Command-T is a Vim plug-in that provides an extremely fast "fuzzy" mechanism
" for Opening files and buffers Jumping to tags and help Running commands,
" orprevious searches and commands with a minimal number of keystrokes.
"Plugin 'wincent/command-t'

" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML
" tags, and more
Plugin 'tpope/vim-surround'

" Comment stuff out
Plugin 'tpope/vim-commentary'

" ALE (Asynchronous Lint Engine) is a plugin for providing linting
Plugin 'w0rp/ale'

" Automated tag generation and syntax highlighting in Vim
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

" tagbar shows functions, variables and other identifiers in a split pane
Plugin 'majutsushi/tagbar'

" Neomake is a plugin for Vim/Neovim to asynchronously run programs.
" You can use it instead of the built-in :make
Plugin 'neomake/neomake'

" VSCode/Sublime Text's awesome multiple selection feature into Vim
Plugin 'terryma/vim-multiple-cursors'

" Markdown / Writting
"Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'LanguageTool'

" Language support
Plugin 'fatih/vim-go'

" Git Support
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
" Git wrapper for Vim. It complements the command line interface to git, but
" doesn�t aim to replace it
Plugin 'tpope/vim-fugitive'
"Plugin 'jaxbot/github-issues.vim'

" Theme / Interface
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'AnsiEsc.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line"source $VIMRUNTIME/vimrc_example.vim
"-------------------------------------------------------------

set runtimepath^=~/.vim

set laststatus=2
"set nocompatible
set tabstop=2 shiftwidth=2 expandtab
set number
set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => behave under OS windows copy/paste/mouse
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source $VIMRUNTIME/mswin.vim
"behave mswin

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=default
if has("gui_running")
  "
  " some display solution behavior
  "
  "get dpi, strip out utf-16 garbage and new lines
  "system() converts 0x00 to 0x01 for 'platform independence'
  "should return something like 'PixelsPerXLogicalInch=192'
  "get the part from the = to the end of the line (eg '=192') and strip
  "the first character
  "and convert to a number
  let dpi = str2nr(strpart(matchstr(substitute(
      \system('wmic desktopmonitor get PixelsPerXLogicalInch /value'),
      \'\%x01\|\%x0a\|\%x0a\|\%xff\|\%xfe', '', 'g'),
      \'=.*$'), 1))
  if dpi > 100
    set guifont=high_dpi_font
  endif

  "
  " some font behavor
  "
  if has('win32') || has('win64')
    "set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
    "set guifont=DejaVu_Sans_Mono:h12:cANSI
    set guifont=Consolas:h10:cANSI
  elseif has("mac") || has("macunix")
    "set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
  elseif has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 10
    "set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
  elseif has("linux")
    set guifont=DejaVu\ Sans\ Mono\ 10
    "set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
  elseif has("unix")
    set gfn=Monospace\ 10
  endif

  "
  " some schema behavior
  "
  "colorscheme gruvbox
  "let g:gruvbox_contrast_light = 'hard'
  "set background=dark    " Setting dark mode
  "set background=light   " Setting light mode
  colorscheme murphy
  set guioptions-=T  " no toolbar
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=51 columns=170 linespace=0
  " Disable scrollbars (real hackers don't use scrollbars for navigation!)
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
else
  " This is console Vim.
  "if exists("+lines")
  "  set lines=50
  "endif
  "if exists("+columns")
  "  set columns=80
  "endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" " let g:syntastic_enable_elixir_checker = 1
" " let g:syntastic_elixir_checkers = ["elixir"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'go': ['go', 'golint', 'errcheck']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neomake settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! BufWritePost * Neomake
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-easytag 
" :UpdateTags command
" :HighlightTags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:easytags_events = ['BufWritePost']
" Let Vim walk up directory hierarchy from CWD to root looking for tags file
" set tags=tags;/
" " Tell EasyTags to use the tags file found by Vim
" let g:easytags_dynamic_files = 1
" Disable automatic highlighting of tags
" let g:easytags_auto_highlight = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-l>  :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown Syntax Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => XML Syntax Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup XML
    autocmd!
    "autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
    let g:xml_syntax_folding=1
    autocmd FileType xml setlocal foldmethod=syntax foldlevelstart=999 foldminlines=0
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Diff export stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%y-%m/%d %H:%M:%S")<cr>

syntax on
filetype plugin indent on

" NERDTree open automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Some mappings
map @@x !%xmllint --format --recover -^M
map <C-n> :NERDTreeToggle<CR>
map <C-Down> <C-E>
map <C-Up> <C-Y>

"EOF
