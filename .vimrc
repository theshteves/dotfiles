""""""""""""""""""""""""""""""""""""""""""""""""""
" Steven Kneiser's dope .vimrc
" 
" Inspired by:
"   https://github.com/amix/vimrc
" 
" Raw version:
"   https://raw.githubusercontent.com/theshteves/dotfiles/master/.vimrc
" 
" Sections:
"	-> Vundle Plugins
"   -> General
"   -> User Interface
"   -> Colors & Fonts
"   -> Text, Tab, & Indent-related
"   -> Tabs, Windows, & Buffers
"   -> Status Line
"   -> Mapping Edits
"   -> Files & Backups
"   -> Macros
" 
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE PLUGINS (Package Manager)
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible 
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'edkolev/tmuxline.vim'
Plugin 'itchyny/lightline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" vim-airline


" tmuxline
let g:tmuxline_powerline_seperators = 0

" lightline
set term=xterm-256color
"set laststatus=2
"let g:lightline = { 'colorscheme': 'wombat'}
"
"function! LightLineFugitive()
"  if exists("*fugitive#head")
"    let _ = fugitive#head()
"    return strlen(_) ? '⭠ '._ : ''
"  endif
"  return ''
"endfunction
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ } }
"      \ 'separator': { 'left': '<', 'right': '>' },
"      \ 'subseparator': { 'left': '<', 'right': '>' }
"		\ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""
" sets number of lines for vim to remember
set history=200

" Enable auto-indenting based on filetype
filetype indent on

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command WQ wq !sudo tee % > /dev/null

" Brutally murder 'Ex mode' 
noremap Q <nop>


""""""""""""""""""""""""""""""""""""""""""""""""""
" USER INTERFACE
""""""""""""""""""""""""""""""""""""""""""""""""""
" avoid messy non-english characters 
let $LANG='en'
set langmenu=en

" Enable command-line auto-completions
set wildmenu
set wildmode=longest:list,full

" Ignore files (compiled, etc.)
set wildignore=*.o,*~,*.pyc,.git\*
 
" Always show current position
set ruler

" Show line numbers
set number

" Center line numbers on the cursor
set relativenumber

" Make backspace work like it should
set backspace=indent,eol,start

" Allow Arrow keys to continue between lines
" set whichwrap+=<,>,h,l,[,]

" Ignore case in search
set ignorecase

" Makes search case-sensitive only when search-term has an uppercase
set smartcase

" Highlight search results
set hlsearch

" Updates search on each keypress
set incsearch

" Prevent redrawing while executing macros (good performace config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" Remove annoying system error alerts (I've grown to like them tho...)
" set noerrorbells
" set novisualbell
" set t_vb=
" set tm=500


""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS & FONTS
""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Sets the background theme (most prefer 'dark')
set bg=light

" Sets UTF-8 as standard encoding 
set encoding=utf8


""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT, TAB, & INDENT-RELATED
""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""""""""""""""""""""""
" TABS, WINDOWS, & BUFFERS
""""""""""""""""""""""""""""""""""""""""""""""""""
" 'up' & 'down' no longer skip long lines that overflow
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?


""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" function! HasPaste()
"     if &paste
"         return 'PASTE MODE  '
"     endif
"     return ''
" endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPING EDITS
""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l


""""""""""""""""""""""""""""""""""""""""""""""""""
" FILES & BACKUPS
""""""""""""""""""""""""""""""""""""""""""""""""""
" Turns backups off (which have saved my life a couple times)
" set nobackup
" set nowp
" set noswapfile

" Opens .json files as if they were a javascript filetype
autocmd BufNewFile,BufRead *.json set ft=javascript

" Ignores capital-typos on write/quit
" Inspired by: http://alexander-hill.tumblr.com/post/78142366738/how-to-fix-the-capital-w-annoyance-in-vim
" :command WQ wq (see line 34)
:command Wq wq
:command W w
:command Q q


""""""""""""""""""""""""""""""""""""""""""""""""""
" HELPFUL MACROS
""""""""""""""""""""""""""""""""""""""""""""""""""
"h - turns word into html tags
let @h="yiWi<pa></Ea>Bf<"

"c - change all of a word
let @c=""

