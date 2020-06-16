"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 0
let g:go_bin_path = expand($GOPATH."/bin")
let g:go_root_path = expand($GOROOT)

" EOF