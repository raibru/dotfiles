"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git Syntax Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.git/COMMIT_EDITMSG    setf gitcommit
autocmd BufNewFile,BufRead *.git/config,.gitconfig setf gitconfig
autocmd BufNewFile,BufRead git-rebase-todo         setf gitrebase
autocmd BufNewFile,BufRead .msg.[0-9]*
			\ if getline(1) =~ '^From.*# This line is ignored.$' |
			\   setf gitsendemail |
			\ endif
autocmd BufNewFile,BufRead *.git/**
			\ if getline(1) =~ '^\x\{40\}\>\|^ref: ' |
			\   setf git |
			\ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Java Syntax Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup ft_java
    au!

    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
    au FileType java inoremap <c-n> <c-x><c-]>
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Javascript Syntax Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown Syntax Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup ft_markdown
    au!

    "au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1
    "au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown foldlevel=1

    "au Filetype markdown setlocal spell
    au Filetype markdown setlocal textwidth=100
    au Filetype markdown setlocal formatoptions+=t

    " Linkify selected text inline to contents of pasteboard.
    au Filetype markdown vnoremap <buffer> <localleader>l <esc>`>a]<esc>`<i[<esc>`>lla()<esc>"+P

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>3 mzI###<space><esc>`zllll
    au Filetype markdown nnoremap <buffer> <localleader>4 mzI####<space><esc>`zlllll
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GO Syntax Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup ft_go
    au!

    au FileType go setlocal shiftwidth=4
    "au FileType go setlocal foldmethod=syntax
    au FileType go nnoremap <buffer> <silent> M :GoDoc<cr>

    " this language is incredible
    au FileType go iabbrev <buffer> ernil if err != nil {<cr>return nil, err<esc>jA}
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Diff Syntax Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup ft_diff
    au!

    autocmd FileType diff setlocal foldmethod=expr
    autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
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
" => Asciidoc Syntax Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup ft_asciidoc
    au!

    au BufNewFile,BufRead *.ad,*.adoc,*.asciidoc setlocal filetype=asciidoc foldlevel=1

    "au Filetype asciidoc setlocal spell
    au Filetype asciidoc setlocal textwidth=100
    au Filetype asciidoc setlocal formatoptions+=t

    " Linkify selected text inline to contents of pasteboard.
    au Filetype asciidoc vnoremap <buffer> <localleader>l <esc>`>a]<esc>`<i[<esc>`>lla()<esc>"+P

    " Use <localleader>1/2/3/4 to add headings.
    au Filetype asciidoc nnoremap <buffer> <localleader>1 mzI=<space><esc>`zllll
    au Filetype asciidoc nnoremap <buffer> <localleader>2 mzI==<space><esc>`zllll
    au Filetype asciidoc nnoremap <buffer> <localleader>3 mzI===<space><esc>`zllll
    au Filetype asciidoc nnoremap <buffer> <localleader>4 mzI====<space><esc>`zlllll
augroup END

" EOF
