" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif
set guifont=Terminus,12

" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org
"set noanti gfn=Terminus
set enc=utf-8

" Also switch on highlighting the last used search pattern.
if has("syntax") && (&t_Co > 2 || has("gui_running"))
  syntax on
  set hlsearch
endif

" Turn off beep
set vb t_vb="<ESC>|30f"

" Hide toolbar
set guioptions-=T
set guioptions+=m

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" colour setting
"colorscheme desert
"colorscheme moria
"colorscheme herald
"colorscheme wombat
