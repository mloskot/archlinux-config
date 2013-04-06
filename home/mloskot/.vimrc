"
" ~/.vimrc - part of dotfiles maintained by Mateusz Loskot <mateusz@loskot.net>
"
" Credits go to:
"   Vincent Driessen - http://nvie.com/posts/how-i-boosted-my-vim/
"   Steveosh - http://stevelosh.com/blog/2010/09/coming-home-to-vim/
"   Haridas N - http://haridas.in/vim-as-your-ide.html
"   Jeffrey Way - http://net.tutsplus.com/sessions/vim-essential-plugins/

" Preamble {{{
filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible
set nomodeline
set shell=/bin/bash
" }}}

" Basic behaviour and user interface experience
" {{{
set title
set visualbell
set noerrorbells
set ttyfast
set number
set showmode
set showcmd " show (partial) command in status line.
set ruler " show the cursor position all the time
set laststatus=2
set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set wildmenu " command-line completion enhanced mode
set wildmode=list:longest
set lazyredraw
set mouse=a

if &t_Co >= 256 || has("gui_running")
    colorscheme molokai "wombat murphy
endif
if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

if has('gui_running')
  set vb t_vb="<ESC>|30f" " Turn off beep
  set guioptions-=T " Hide toolbar
  set guioptions+=m " Show menubar
  set guifont=Terminus ""DejaVu Sans Mono"
endif
" }}}

" File and buffer handling
" {{{
set encoding=utf-8
set nobackup
set noswapfile
set autowrite " automatically save before commands like :next and :make
set hidden
au FocusLost * :wa " emulate TextMate's save on losing focus feature
" }}}

" Mappings
" {{{
let mapleader = ","
set backspace=indent,eol,start
" quick escaping insert mode
inoremap jj <ESC>
"   Moving
"   {{{
" use jkl; instead of hjkl as ergonomic alternative over historic
noremap ; l
noremap l k
noremap k j
noremap j h
" disable default arrow keys to practice hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" disable F1 help key to make aiming ESC easier
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
"   }}}
"   Splits
"   {{{
" open new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l
" open new horizontal split and switch to it
nnoremap <leader>s <C-w>s<C-w>l
" move around splits
nnoremap <C-Left>  <C-w>h
nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Right> <C-w>l
"   }}}
"   Utilities
"   {{{
" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" re-hardwrap paragraphs of text
nnoremap <leader>q gqip
" ,ft mapped to a fold tag function:
nnoremap <leader>ft Vatzf
" bring Ack ready to search - https://github.com/mileszs/ack.vim
nnoremap <leader>a :Ack 
"   }}}
" }}}

" Searching and replacing
" {{{
" turn off Vim default regex characters and make searches use normal regexes
nnoremap / /\v
vnoremap / /\v
" deal with case-sensitive search intelligently
set ignorecase
set smartcase
" apply global substitutions automatically on lines
"set gdefault
" highlight search results
set incsearch
set hlsearch
set showmatch " show matching brackets.
set matchtime=3 " tenths of a second delay for 'showmatch' to kick in
set scrolloff=5 " move to display at least 5 lines of context
set synmaxcol=800 " don't highlight lines longer than n characters
" make it easy to clear out a search highlights by typing ,<space> or ,/
"nnoremap <leader><space> :nohlsearch<CR>
nmap <silent> ,/ :nohlsearch<CR>
" make tab key match bracket pairs, easier than %
nnoremap <tab> %
vnoremap <tab> %
" }}}

" Editing
" {{{
set cursorline
" handle long lines
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=85
" folding
set foldmethod=indent " syntex
" indentation
set cindent
" tab key
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" show invisible characters with the same characters that TextMate uses
"set list " disabled by default
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
" }}}

" Plugins {{{
"   NERDTree {{{
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']
"   }}}
"   MiniBuffer {{{
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapCTabSwitchWindows = 1
"   }}}
"   Rainbow Paranthesis {{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"   }}}
" }}}
