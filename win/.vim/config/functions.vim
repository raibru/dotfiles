"============== Custom Functions ===============
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => toggle between clang header and source
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "c" || expand ("%:e") == "cpp")
    find %:t:r.h
  else
    find %:t:r.c
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Format_WhiteSpace_RemoveTrailing()
	:%s/\v\s*$//g
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Format_Inflection_ToCamelCase()
	:s/\v([a-z])_([a-z])/\1\u\2/g
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Format_Inflection_ToUnderscored()
	:s/\v([a-z])([A-Z])/\L\1_\2/g
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CheckTabs()
	if search("\t") != 0
		echohl ErrorMsg | ec "                                 !WARNING!                              "
					\ |              ec "There are tabs in the file, do you want to convert them to spaces? [Y/n]" | echohl None
		let choice = nr2char(getchar())
		if choice == 'y' || choice == "\<CR>"
			retab 2
		endif
	else
		return
	endif
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! EnsureDirExists ()
	let required_dir = expand("%:h")
	if !isdirectory(required_dir)
		call mkdir(required_dir, 'p')
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" screen stuff
function! s:Sinit(filen)
	echo expand(a:filen)
	exec "ScreenShell cd " . expand(a:filen) . "; \\clear"
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" FocusMode
function! ToggleFocusMode()
	if (&foldcolumn != 12)
		set laststatus=0
		set numberwidth=10
		set foldcolumn=12
		set noruler
		hi FoldColumn ctermbg=none
		hi LineNr ctermfg=0 ctermbg=none
		hi NonText ctermfg=0
        set nonu norelativenumber
        GitGutterDisable
	else
		set laststatus=2
		set numberwidth=4
		set foldcolumn=0
		set ruler
        set nu relativenumber
        GitGutterEnable
		colorscheme skittles_berry "re-call your colorscheme
	endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line ------------------------------------------------------------- {{{
function! StatusLineMode()
    let mode = mode()

    if mode == "n"
        call GoodWolfHL('GWStatusLineMode', 'coal', 'lime', 'bold')
        call GoodWolfHL('GWStatusLineModeX', 'lime', 'deepergravel')
        call GoodWolfHL('GWStatusLineModeY', 'lime', 'deepgravel')
        return "NORMAL"
    elseif mode == "no"
        call GoodWolfHL('GWStatusLineMode', 'coal', 'lime', 'bold')
        call GoodWolfHL('GWStatusLineModeX', 'lime', 'deepergravel')
        call GoodWolfHL('GWStatusLineModeY', 'lime', 'deepgravel')
        return "OPERATOR"
    elseif mode == "V" || mode == ""
        call GoodWolfHL('GWStatusLineMode', 'coal', 'dirtyblonde', 'bold')
        call GoodWolfHL('GWStatusLineModeX', 'dirtyblonde', 'deepergravel')
        call GoodWolfHL('GWStatusLineModeY', 'dirtyblonde', 'deepgravel')
        return "VISUAL"
    elseif mode == "s" || mode == "S" || mode == ""
        call GoodWolfHL('GWStatusLineMode', 'coal', 'dirtyblonde', 'bold')
        call GoodWolfHL('GWStatusLineModeX', 'dirtyblonde', 'deepergravel')
        call GoodWolfHL('GWStatusLineModeY', 'dirtyblonde', 'deepgravel')
        return "SELECT"
    elseif mode == "i"
        call GoodWolfHL('GWStatusLineMode', 'coal', 'tardis', 'bold')
        call GoodWolfHL('GWStatusLineModeX', 'tardis', 'deepergravel')
        call GoodWolfHL('GWStatusLineModeY', 'tardis', 'deepgravel')
        return "INSERT"
    elseif mode == "r" || mode == "Rv"
        call GoodWolfHL('GWStatusLineMode', 'coal', 'taffy', 'bold')
        call GoodWolfHL('GWStatusLineModeX', 'taffy', 'deepergravel')
        call GoodWolfHL('GWStatusLineModeY', 'taffy', 'deepgravel')
        return "REPLACE"
    elseif mode == "t"
        call GoodWolfHL('GWStatusLineMode', 'coal', 'tardis', 'bold')
        call GoodWolfHL('GWStatusLineModeX', 'tardis', 'deepergravel')
        call GoodWolfHL('GWStatusLineModeY', 'tardis', 'deepgravel')
        return "TERMINAL"
    else
        call GoodWolfHL('GWStatusLineMode', 'coal', 'lime', 'bold')
        call GoodWolfHL('GWStatusLineModeX', 'lime', 'deepergravel')
        call GoodWolfHL('GWStatusLineModeY', 'lime', 'deepgravel')
        return "OTHER"
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetStatusLine(winnr)
    let s = ""

    if a:winnr == winnr()
        "let errors = SyntasticStatuslineFlag()
	let errors = ""

        let s .= "%#GWStatusLineMode#"
        let s .= " "
        let s .= "%{StatusLineMode()}"
        let s .= " "
        let s .= "%#GWStatusLineModeX#"
        let s .= " "

        if strlen(errors) != 0
            let s .= "%#Error#"
            let s .= errors
            let s .= "%#GWStatusLineModeX# "
        endif

        let s .= "%f"
        let s .= " %m%r%h%w"
        let s .= "%="

        let s .= " %y"
        let s .= " \[%{&fileencoding?&fileencoding:&encoding}/%{&fileformat}\] "

        let s .= "%#GWStatusLineModeY#"
        let s .= ""
        let s .= "%#GWStatusLineMode#"
        let s .= " %c:"
        let s .= "%l"        " Current line
        let s .= "/"
        let s .= "%L"        " Total lines
        let s .= " "
    else
        let s .= "%#StatusLineNC#"
        let s .= "%f"
        let s .= " %m%r%h%w"
        let s .= "%="
        let s .= " %y"
        let s .= " \[%{&fileencoding?&fileencoding:&encoding}/%{&fileformat}\] "
    endif

    return s
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RefreshStatusLine()
    for nr in range(1, winnr('$'))
        call setwinvar(nr, '&statusline', '%!SetStatusLine(' . nr . ')')
    endfor
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is from https://github.com/sgeb/vim-diff-fold/ without the extra
" settings crap.  Just the folding expr.
function! DiffFoldLevel()
    let l:line=getline(v:lnum)

    if l:line =~# '^\(diff\|Index\)'     " file
        return '>1'
    elseif l:line =~# '^\(@@\|\d\)'  " hunk
        return '>2'
    elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$' " context: file1
        return '>2'
    elseif l:line =~# '^--- \d\+,\d\+ ----$'     " context: file2
        return '>2'
    else
        return '='
    endif
endfunction

" EOF
