
"============== Custom scripts ===============
"source ~/.vim/after/syntaxcheck.vim

"============== Filetype stuff ===============
filetype plugin on
filetype indent on
source ~/.vim/config/filetype.vim

"============== Script configs ===============

" Color spezific settings
source ~/.vim/colors/goodwolf.vim

" Load custom settings
source ~/.vim/config/settings.vim
source ~/.vim/config/bundles.vim
source ~/.vim/config/functions.vim
source ~/.vim/config/commands.vim
source ~/.vim/config/mappings.vim
source ~/.vim/config/abbrs.vim
source ~/.vim/config/gui.vim
source ~/.vim/config/color.vim

" Syntax-specific settings
source ~/.vim/syntax/confluencewiki.vim
source ~/.vim/syntax/git.vim
source ~/.vim/syntax/gitcommit.vim
source ~/.vim/syntax/gitrebase.vim
source ~/.vim/syntax/nginx.vim
source ~/.vim/syntax/md.vim
source ~/.vim/syntax/yaml.vim

" EOF