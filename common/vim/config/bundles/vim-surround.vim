"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

noremap <silent><leader>r' ysiw'
noremap <silent><leader>r" ysiw"
" delete surrounding characters
"noremap ds{ F{xf}x
"noremap cs{ F{xf}xi
"noremap ds" F"x,x
"noremap cs" F"x,xi
"noremap ds' F'x,x
"noremap cs' F'x,xi
"noremap ds( F(xf)x
"noremap cs( F(xf)xi
"noremap ds) F(xf)x
"noremap cs) F(xf)xi

" EOF