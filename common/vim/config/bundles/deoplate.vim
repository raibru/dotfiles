"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set completeopt +=noinsert
"set completeopt =menu,preview
"set completeopt +=noselect
"set completeopt -=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = expand($GOPATH.'/bin/gocode')
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"let g:deoplete#sources#go#source_importer = 1
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/'
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <C-SPACE>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

" EOF