"
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
if exists('g:vscode')
    source vimrc-vscode
else
    source vimrc
endif
    
"source ~/.vimrc

" linewrapping junk
set wrap
set linebreak
set nolist 
" keeps vim from inserting newlines in freshly entered text
set textwidth=0
set wrapmargin=0

" key bindings to move along visually displayed lines as with a fancy text
" editor

if exists('g:vscode')
    nmap j gj
    nmap k gk
    vmap j gj
    vmap k gk
    nmap <Down> gj
    nmap <Up> gk
    vmap <Down> gj
    vmap <Up> gk
    imap <Down> <C-o>gj
    imap <Up> <C-o>gk
    
    function! s:manageEditorSize(...)
        let count = a:1
        let to = a:2
        for i in range(1, count ? count : 1)
            call VSCodeNotify(to == 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
        endfor
    endfunction

    function! s:vscodeCommentary(...) abort
        if !a:0
            let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
            return 'g@'
        elseif a:0 > 1
            let [line1, line2] = [a:1, a:2]
        else
            let [line1, line2] = [line("'["), line("']")]
        endif

        call VSCodeCallRange("editor.action.commentLine", line1, line2, 0)
    endfunction

    function! s:openVSCodeCommandsInVisualMode()
        normal! gv
        let visualmode = visualmode()
        if visualmode == "V"
            let startLine = line("v")
            let endLine = line(".")
            call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
        else
            let startPos = getpos("v")
            let endPos = getpos(".")
            call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
        endif
    endfunction

    function! s:openWhichKeyInVisualMode()
        normal! gv
        let visualmode = visualmode()
        if visualmode == "V"
            let startLine = line("v")
            let endLine = line(".")
            call VSCodeNotifyRange("whichkey.show", startLine, endLine, 1)
        else
            let startPos = getpos("v")
            let endPos = getpos(".")
            call VSCodeNotifyRangePos("whichkey.show", startPos[1], endPos[1], startPos[2], endPos[2], 1)
        endif
    endfunction

    " 
    " Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
    xnoremap <expr> <C-/> <SID>vscodeCommentary()
    nnoremap <expr> <C-/> <SID>vscodeCommentary() . '_'
    nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

    nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
    xnoremap <silent> <Space> :<C-u>call <SID>openWhichKeyInVisualMode()<CR>

    "xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine

    " Simulate same TAB behavior in VSCode
    nmap <Tab> :Tabnext<CR>
    nmap <S-Tab> :Tabprev<CR>

else
" Without vscode as frontend
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
    nnoremap <Down> gj
    nnoremap <Up> gk
    vnoremap <Down> gj
    vnoremap <Up> gk
    inoremap <Down> <C-o>gj
    inoremap <Up> <C-o>gk
endif
