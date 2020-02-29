"
" Settings
"
"custom mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => change behaviour of <ESC> handling to get out of 
"    insert-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap jk <ESC>
"inoremap kj <ESC>
"inoremap <ESC> <Nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => toggle between clang header and source
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <c-s> :call SwitchSourceHeader()<CR>
"nmap ,s :call SwitchSourceHeader()<CR>
nnoremap <leader>s :call SwitchSourceHeader()<CR>
"nmap <s :call SwitchSourceHeader()<CR>

nnoremap @@x :%!tidy --indent yes --indent-spaces 4 --indent-attributes yes --wrap-attributes yes -wrap 300 -q -i -xml<CR>
nnoremap @@r :%s/\r//g<CR>
nnoremap @@l !%xmllint --format --recover -^M
" Clean trailing whitespace
nnoremap @@w mz:%s/\s\+$//<cr>:let @/=''<cr>`z


map <C-Down> <C-E>
map <C-Up> <C-Y>
map <M-PageUp> :bp<CR>
map <M-PageDown> :bn<CR>
map <M-up> :m-2<CR>
map <M-down> :m+1<CR>

nmap <F5> :redraw!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unmap the arrow keys
ino <down> <Nop>
ino <up> <Nop>
"ino <right> <Nop>
"ino <left> <Nop>
"no <down> ddp
"no <left> <Nop>
"no <right> <Nop>
"no <up> ddkP
"vno <down> <Nop>
"vno <left> <Nop>
"vno <right> <Nop>
"vno <up> <Nop>

"============== Custom Mappings ===============

" custom comma motion mapping
" delete command dd is not working correct only after hit esc line is deleted
"nmap di, f,dT,
"nmap ci, f,cT,
"nmap da, f,ld2F,i,<ESC>l "delete argument 
"nmap ca, f,ld2F,i,<ESC>a "delete arg and insert

"turn off search highlighting
nmap <C-n> :noh<CR>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>n :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><leader>ff :Files<cr>
nnoremap <silent><leader>fb :Buffers<cr>
nnoremap <silent><leader>fh :History<cr>
nnoremap <silent><leader>fl :Lines<cr>
nnoremap <silent><leader>fc :BLines<cr>
nnoremap <silent><leader>ag :Ag <C-R><C-W><cr>
nnoremap <silent><leader>AG :Ag <C-R><C-A><cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>t  :TagbarToggle<CR>
nmap <leader>t<  :tp<CR>
nmap <leader>t>  :tn<CR>
nmap <leader>t=  :ts<CR>                     " list all called tags"
nmap <leader>tl  :call feedkeys("g]")<CR>    " list tags definition under cursor
nmap <leader>tl  :call feedkeys("<C-T>")<CR> " jump back to tags call position

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surrounding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"===============================================================================
" Git/Fugitive
"===============================================================================
nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gs :Gstatus<cr>

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

" Buffer
nnoremap <leader>b< :bp<cr>
nnoremap <leader>b> :bn<cr>
nnoremap <leader>b= :ls<cr>

" Wrap
nnoremap <leader>W :set wrap!<cr>

" Copying/pasting text to the system clipboard.
noremap  <leader><leader>p "+p
vnoremap <leader><leader>y "+y
nnoremap <leader><leader>y VV"+y
nnoremap <leader><leader>Y "+y

" Reselect last-pasted text
nnoremap gv `[v`]

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
