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
"Plugin 'scrooloose/nerdtree'              " NERDTree is a file system explorer for the Vim editor
Plugin 'vim-airline/vim-airline'          " Lean & mean status/tabline for vim that's light as air
Plugin 'junegunn/fzf', { 'do': './fzf --all' }
Plugin 'junegunn/fzf.vim'                 " It's an interactive Unix filter for command-line that can
                                          "   be used with any list; files, command history, processes,
                                          "   hostnames, bookmarks, git commits, etc
Plugin 'mileszs/ack.vim'                  " Run your favorite search tool from Vim, with an enhanced results list
Plugin 'tpope/vim-surround'               " Surround.vim is all about 'surroundings': parentheses, brackets,
                                          "   quotes, XML tags, and more
"Plugin 'xolox/vim-misc'                   " Automated tag generation and syntax highlighting in Vim
"Plugin 'xolox/vim-easytags'               " need xolos/vim-misc
"Plugin 'majutsushi/tagbar'                " tagbar shows functions, variables and other identifiers in a split pane
Plugin 'easymotion'                       " EasyMotion provides a much simpler way to use some motions in vim
Plugin 'Raimondi/delimitMate'             " This plug-in provides automatic closing of quotes, parenthesis, brackets,
                                          "   etc., besides some other related features
"Plugin 'nathanaelkane/vim-indent-guides' " Indent Guides is a plugin for visually displaying indent levels in Vim
Plugin 'mbbill/undotree'                  " The undo history visualizer for VIM and makes it easier to browse and
                                          "   switch between different undo branches.
Plugin 'godlygeek/tabular'                " Vim script for text filtering and alignment. abularize lets you align
                                          "   statements on their equal signs and other characters

"Plugin 'fatih/vim-go'                     " Language support for go lang

"Plugin 'Shougo/deoplete.nvim'             " Real-time completion (Neovim and Vim 8)
"Plugin 'roxma/nvim-yarp'
"Plugin 'roxma/vim-hug-neovim-rpc'

" Lint Support
"Plugin 'w0rp/ale'                         " ALE (Asynchronous Lint Engine) is a plugin for providing linting

" Docomentation Support
Plugin 'vimwiki/vimwiki'                  " Vimwiki is a personal wiki for Vim -- a number of linked text files
                                          "   that have their own syntax highlighting
" Markdown Support
Plugin 'tpope/vim-markdown'               " Markdown / Writting
Plugin 'jtratner/vim-flavored-markdown'

" Git Support
"Plugin 'tpope/vim-fugitive'               " Git wrapper for Vim. It complements the command line interface to git,
                                          "   but does not aim to replace it
"Plugin 'kablamo/vim-git-log'              " Git log support
"Plugin 'gregsexton/gitv'                  " The goal is to give you a similar set of functionality as a repository viewer support
"Plugin 'airblade/vim-gitgutter'           " A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows whether
                                          " each line has been added, modified, and where lines have been removed
" ???!!!
"Plugin 'LanguageTool'
"Plugin 'suan/vim-instant-markdown'        " Instant Markdown preview from vim
""Plugin 'jaxbot/github-issues.vim'

" Colors
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *** Bumdle Configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/config/bundles/ack.vim
"source ~/.vim/config/bundles/ale.vim
source ~/.vim/config/bundles/delimitmate.vim
"source ~/.vim/config/bundles/deoplate.vim
source ~/.vim/config/bundles/easymotion.vim
source ~/.vim/config/bundles/fzf.vim
"source ~/.vim/config/bundles/nerdtree.vim
"source ~/.vim/config/bundles/nvim-yarp.vim
source ~/.vim/config/bundles/tabular.vim
"source ~/.vim/config/bundles/tagbar.vim
source ~/.vim/config/bundles/undotree.vim
source ~/.vim/config/bundles/vim-airline.vim
"source ~/.vim/config/bundles/vim-easytags.vim
source ~/.vim/config/bundles/vim-flavored-markdown.vim
"source ~/.vim/config/bundles/vim-fugitive.vim
"source ~/.vim/config/bundles/vim-gitgutter.vim
"source ~/.vim/config/bundles/vim-git-log.vim
"source ~/.vim/config/bundles/vim-go.vim
source ~/.vim/config/bundles/vim-markdown.vim
"source ~/.vim/config/bundles/vim-misc.vim
source ~/.vim/config/bundles/vim-surround.vim
source ~/.vim/config/bundles/vim-wiki.vim

" EOF