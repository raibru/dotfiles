"
" Settings
"
"custom mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => toggle between clang header and source
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <c-s> :call SwitchSourceHeader()<CR>
"nmap ,s :call SwitchSourceHeader()<CR>
nnoremap <leader>s :call SwitchSourceHeader()<CR>
"nmap <s :call SwitchSourceHeader()<CR>

map @@x :%!tidy --indent yes --indent-spaces 4 --indent-attributes yes --wrap-attributes yes -wrap 300 -q -i -xml<CR>
map @@r :%s/\r//g<CR>
map @@l !%xmllint --format --recover -^M

map <C-Down> <C-E>
map <C-Up> <C-Y>
map <M-PageUp> :bp<CR>
map <M-PageDown> :bn<CR>
map <M-up> :m-2<CR>
map <M-down> :m+1<CR>

nmap <F5> :redraw!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unmap the arrow keys
"no <down> ddp
"no <left> <Nop>
"no <right> <Nop>
"no <up> ddkP
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
"vno <down> <Nop>
"vno <left> <Nop>
"vno <right> <Nop>
"vno <up> <Nop>

"============== Custom Mappings ===============
" tabs mapping have to check: I not working with tabs
"open tag in new tab
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"nmap <C-Tab> :tabnext<CR>
"nmap <C-S-Tab> :tabprevious<CR>
"map <C-S-Tab> :tabprevious<CR>
"map <C-Tab> :tabnext<CR>
"imap <C-S-Tab> <ESC>:tabprevious<CR>
"imap <C-Tab> <ESC>:tabnext<CR>
"noremap <F7> :set expandtab!<CR>
"nmap <Leader>h :tabnew %:h<CR>

"turn off search highlighting
nmap <C-n> :noh<CR>

" custom comma motion mapping
" delete command dd is not working correct only after hit esc line is deleted
"nmap di, f,dT,
"nmap ci, f,cT,
"nmap da, f,ld2F,i,<ESC>l "delete argument 
"nmap ca, f,ld2F,i,<ESC>a "delete arg and insert

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

" CTRL-P mappings
" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

nmap cu ct_
nmap cU cf_

" upper or lowercase the current word
nmap g^ gUiW
nmap gv guiW

" diff
nmap ]c ]czz
nmap [c [czz

" default to very magic
no / /\v

" gO to create a new line below cursor in normal mode
nmap g<C-O> o<ESC>k
" g<Ctrl+o> to create a new line above cursor (Ctrl to prevent collision with 'go' command)
nmap gO O<ESC>j

"I really hate that things don't auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

"quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" replace string contents with recently copied text
nmap <Leader>r" "_di"P
nmap <Leader>c" "_di"Pa
nmap <Leader>r' '_di'P
nmap <Leader>c' '_di'Pa

"nmap ]h <Plug>GitGutterNextHunk
"nmap [h <Plug>GitGutterPrevHunk
nmap <leader>g] <Plug>GitGutterNextHunk
nmap <leader>g[ <Plug>GitGutterPrevHunk
nmap <leader>gg :GitGutterToggle<CR>
nmap <leader>gv :Gitv<CR>

nmap <leader>u :UndotreeToggle<CR>

" Sort lines
nnoremap <leader>o vip:sort<cr>
vnoremap <leader>o :sort<cr>

" Buffer/Tabs
""nnoremap <leader>( :tabprev<cr>
""nnoremap <leader>) :tabnext<cr>
nnoremap <leader>( :bp<cr>
nnoremap <leader>) :bn<cr>
nnoremap <leader>= :ls<cr>

" Wrap
nnoremap <leader>W :set wrap!<cr>

" Copying/pasting text to the system clipboard.
noremap  <leader><leader>p "+p
vnoremap <leader><leader>y "+y
nnoremap <leader><leader>y VV"+y
nnoremap <leader><leader>Y "+y

" Reselect last-pasted text
nnoremap gv `[v`]

" Clean trailing whitespace
nnoremap @@w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" "Uppercase word" mapping.
"
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za

" Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Join an entire paragraph.
"
" Useful for writing GitHub comments in actual Markdown and then translating it
" to their bastardized version of Markdown.
nnoremap <leader>j mzvipJ`z

" Window Resizing {{{
" right/up : bigger
" left/down : smaller
nnoremap <C-S-right> :vertical resize +3<cr>
nnoremap <C-S-left> :vertical resize -3<cr>
nnoremap <C-S-up> :resize +3<cr>
nnoremap <C-S-down> :resize -3<cr>

" Instant Markdown preview
map <leader>md :InstantMarkdownPreview<CR>

" Pandoc markdown html
nmap <leader>mc   :RunSilent pandoc -o ~/.vim/tmp/vim-pandoc-out.html %<CR>
nmap <leader>mv   :RunSilent /usr/bin/google-chrome-stable ~/.vim/tmp/vim-pandoc-out.html<CR>

" EOF
