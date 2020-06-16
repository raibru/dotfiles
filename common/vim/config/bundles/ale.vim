"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_linters = {
\   'c': ['cppcheck'],
\   'cpp': ['cppcheck'],
\   'go': ['go', 'golint', 'errcheck']
\}

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" EOF