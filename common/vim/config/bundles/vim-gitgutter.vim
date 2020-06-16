"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim git gutter
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

"nmap ]h <Plug>GitGutterNextHunk
"nmap [h <Plug>GitGutterPrevHunk
nmap <leader>g] <Plug>GitGutterNextHunk
nmap <leader>g[ <Plug>GitGutterPrevHunk
nmap <leader>gg :GitGutterToggle<CR>
nmap <leader>gv :Gitv<CR>

" EOF