"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => behave under OS windows copy/paste/mouse
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source $VIMRUNTIME/mswin.vim
"behave mswin

let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 10
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
let g:indent_guides_space_guides = 1
let g:indent_guides_guide_size = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=default
if has("gui_running")
  "
  " some display solution behavior
  "
  "get dpi, strip out utf-16 garbage and new lines
  "system() converts 0x00 to 0x01 for 'platform independence'
  "should return something like 'PixelsPerXLogicalInch=192'
  "get the part from the = to the end of the line (eg '=192') and strip
  "the first character
  "and convert to a number
  let dpi = str2nr(strpart(matchstr(substitute(
      \system('wmic desktopmonitor get PixelsPerXLogicalInch /value'),
      \'\%x01\|\%x0a\|\%x0a\|\%xff\|\%xfe', '', 'g'),
      \'=.*$'), 1))
  if dpi > 100
    set guifont=high_dpi_font
  endif

  "
  " some font behavor
  "
  if has('win32') || has('win64')
    "set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
    "set guifont=DejaVu_Sans_Mono:h12:cANSI
    set guifont=Consolas:h11:cANSI
  elseif has("mac") || has("macunix")
    "set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
  elseif has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 11
    "set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
  elseif has("linux")
    set guifont=DejaVu\ Sans\ Mono\ 11
    "set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
  elseif has("unix")
    set gfn=Monospace\ 11
  endif

  "
  " some schema behavior
  " see color.vim
  "
  set guioptions-=T  " no toolbar
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=51 columns=170 linespace=0
  " Disable scrollbars (real hackers don't use scrollbars for navigation!)
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
else
  " This is console Vim.
  "if exists("+lines")
  "  set lines=50
  "endif
  "if exists("+columns")
  "  set columns=80
  "endif
endif

" Set up vertical vs block cursor for insert/normal mode
if &term =~ "screen."
  let &t_ti.="\eP\e[1 q\e\\"
  let &t_SI.="\eP\e[5 q\e\\"
  let &t_EI.="\eP\e[1 q\e\\"
  let &t_te.="\eP\e[0 q\e\\"
else
  let &t_ti.="\<Esc>[1 q"
  let &t_SI.="\<Esc>[5 q"
  let &t_EI.="\<Esc>[1 q"
  let &t_te.="\<Esc>[0 q"
endif
                                   
" EOF
