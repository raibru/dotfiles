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

Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle, required

" Utility
Plugin 'scrooloose/nerdtree'              " NERDTree is a file system explorer for the Vim editor
Plugin 'vim-airline/vim-airline'          " Lean & mean status/tabline for vim that's light as air
Plugin 'kien/ctrlp.vim'                   " Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'junegunn/fzf'                     " It's an interactive Unix filter for command-line that can
                                          "   be used with any list; files, command history, processes,
                                          "   hostnames, bookmarks, git commits, etc
Plugin 'mileszs/ack.vim'                  " Run your favorite search tool from Vim, with an enhanced results list
Plugin 'tpope/vim-surround'               " Surround.vim is all about 'surroundings': parentheses, brackets,
                                          "   quotes, XML tags, and more
Plugin 'tpope/vim-commentary'             " Comment stuff out gcc to comment out a line (takes a count)
Plugin 'xolox/vim-misc'                   " Automated tag generation and syntax highlighting in Vim
Plugin 'xolox/vim-easytags'               " need xolos/vim-misc
Plugin 'majutsushi/tagbar'                " tagbar shows functions, variables and other identifiers in a split pane
Plugin 'easymotion'                       " EasyMotion provides a much simpler way to use some motions in vim
Plugin 'neomake/neomake'                  " Neomake is a plugin for Vim/Neovim to asynchronously run programs.
                                          "   You can use it instead of the built-in :make
Plugin 'terryma/vim-multiple-cursors'     " VSCode/Sublime Text's awesome multiple selection feature into Vim
Plugin 'Raimondi/delimitMate'             " This plug-in provides automatic closing of quotes, parenthesis, brackets,
                                          "   etc., besides some other related features
"Plugin 'nathanaelkane/vim-indent-guides' " Indent Guides is a plugin for visually displaying indent levels in Vim
Plugin 'mbbill/undotree'                  " The undo history visualizer for VIM and makes it easier to browse and
                                          "   switch between different undo branches.
Plugin 'godlygeek/tabular'                " Vim script for text filtering and alignment. abularize lets you align
                                          "   statements on their equal signs and other characters
Plugin 'Shougo/neocomplete.vim'           " Neocomplete is an autocomplete plugin with additional support for snippets

" Lint Support
Plugin 'vim-syntastic/syntastic'          " Syntastic is a syntax checking plugin and runs files through external
                                          "   syntax checkers and displays any resulting errors to the user
Plugin 'w0rp/ale'                         " ALE (Asynchronous Lint Engine) is a plugin for providing linting

" Docomentation Support
" VimWiki
Plugin 'vimwiki/vimwiki'                  " Vimwiki is a personal wiki for Vim -- a number of linked text files
                                          "   that have their own syntax highlighting
" Markdown Support
"Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'               " Markdown / Writting
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'LanguageTool'
Plugin 'fatih/vim-go'                     " Language support for go lang
Plugin 'suan/vim-instant-markdown'        " Instant Markdown preview from vim

" Git Support
Plugin 'tpope/vim-fugitive'               " Git wrapper for Vim. It complements the command line interface to git,
                                          "   but does not aim to replace it
Plugin 'kablamo/vim-git-log'              " Git log support
Plugin 'gregsexton/gitv'                  " The goal is to give you a similar set of functionality as a repository viewer support
Plugin 'airblade/vim-gitgutter'           " A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows whether
                                          " each line has been added, modified, and where lines have been removed
"Plugin 'jaxbot/github-issues.vim'

" Theme / Interface
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'AnsiEsc.vim'

" Command-T is a Vim plug-in that provides an extremely fast "fuzzy" mechanism
" for Opening files and buffers Jumping to tags and help Running commands,
" orprevious searches and commands with a minimal number of keystrokes.
"Plugin 'wincent/command-t'

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *** Bumdle Configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
" NERDTree open automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

nmap <leader>n :NERDTreeToggle<CR>

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
" => CtrlP settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'c': ['cppcheck'],
\   'cpp': ['cppcheck'],
\   'go': ['go', 'golint', 'errcheck']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easymotion settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The default leader has been changed to <Leader><Leader> to avoid
" conflicts with other plugins you may have installed.
" All motions are now triggered with <Leader><Leader> by default,
" e.g. <Leader><Leader>t, <Leader><Leader>gE
" This can easily be changed back to pre-1.3 behavior by rebinding
" the leader in your vimrc:
"let g:EasyMotion_leader_key = '<Leader>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neomake settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd! BufWritePost * Neomake
"let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']

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
"nmap <C-l>  :TagbarToggle<CR>
nmap <leader>t  :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GIT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set up the highlight groups
"GitGutterAdd          " an added line
"GitGutterChange       " a changed line
"GitGutterDelete       " at least one removed line
"GitGutterChangeDelete " a changed line followed by at least one removed line

"GitGutterAddLine          " default: links to DiffAdd
"GitGutterChangeLine       " default: links to DiffChange
"GitGutterDeleteLine       " default: links to DiffDelete
"GitGutterChangeDeleteLine " default: links to GitGutterChangeLineDefault, i.e. DiffChange

let g:gitgutter_highlight_lines = 0 " to turn off line highlighting by default
let g:gitgutter_signs           = 1 " to turn on signs by default
let g:gitgutter_enabled         = 0 " Set gitgutter at start off

"let g:gitgutter_sign_modified = '≈ '
"let g:gitgutter_sign_removed = '⌐ '
"let g:gitgutter_sign_added = 'xx'
"let g:gitgutter_sign_modified = 'yy'
"let g:gitgutter_sign_removed = 'zz'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_modified_removed = 'ww'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimwiki settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown' }
let g:vimwiki_ext2syntax = {'.mdw': 'markdown', '.mdwiki': 'markdown' }
" helppage -> :h vimwiki-syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-instant-markdown settings
" Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0    " disable autostart

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabularize
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<Leader>a= :Tabularize /=<CR>
"<Leader>a: :Tabularize /:<CR>
"<Leader>a:: :Tabularize /:\zs<CR>
"<Leader>a, :Tabularize /,<CR>
"<Leader>a<Bar> :Tabularize /<Bar><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0                             " Disable AutoComplPop
let g:neocomplete#enable_at_startup = 0                   " Use neocomplete
let g:neocomplete#enable_smart_case = 1                   " Use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3   " Set minimum syntax keyword length

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ack settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" EOF
