"""""""""""""""""""""""""""""""""""""""""""""""{{{
"
" Steven Kneiser's dope .vimrc
" 
" Inspired by:
"   https://github.com/amix/vimrc
" 
" Raw version:
"   https://raw.githubusercontent.com/theshteves/dotfiles/master/.vimrc
"
" Navigating this .vimrc w/folds:
"   I provided manual fold markers so you can shrink and expand this file at 
"   your pleasure so first enable folding in you current buffer:
"   
"   	:set foldmethod=marker
"
"	Now you can press "za" within any Section to shrink/expand multiple lines
"
" Sections:
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
"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" GENERAL
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" Welcome user
" echom "【 = ◈  ︿ ◈  = 】"

" Sets number of lines for vim to remember
set history=200

" Enable auto-indenting based on filetype
filetype indent on

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command WQ wq !sudo tee % > /dev/null

" Brutally murder 'Ex mode' 
noremap Q <nop>

" Ctags for cross-language definition finding
set tags=tags;


"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" USER INTERFACE
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
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
"set relativenumber

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


"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" COLORS & FONTS
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" Enable syntax highlighting
syntax on

" Sets the background theme (most prefer 'dark')
set bg=light

" Sets UTF-8 as standard encoding 
set encoding=utf8


"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" TEXT, TAB, & INDENT-RELATED
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" 1 tab == 4 spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Colors columns past 79 characters (promotes good practice)
let &colorcolumn="80,".join(range(81,200),",")
highlight ColorColumn ctermbg=0 guibg=lightgrey


"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" TABS, WINDOWS, & BUFFERS
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" 'up' & 'down' no longer skip long lines that overflow
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?


"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" STATUS LINE
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
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


"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" MAPPING EDITS
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l


"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" FILES & BACKUPS
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
" Turns backups off (which have saved my life a couple times)
" set nobackup
" set nowp
" set noswapfile

" Opens .json files as if they were a javascript filetype
autocmd BufNewFile,BufRead *.json set ft=javascript

" .sol is for Solidity
autocmd BufNewFile,BufRead *.sol set ft=sol

" Ignores capital-typos on write/quit
" Inspired by: http://alexander-hill.tumblr.com/post/78142366738/how-to-fix-the-capital-w-annoyance-in-vim
" :command WQ wq (see line 34)
:command Wq wq
:command W w
:command Q q


"""""""""""""""""""""""""""""""""""""""""""""""}}}
"
" HELPFUL MACROS
"
"""""""""""""""""""""""""""""""""""""""""""""""{{{
"h - turns word into html tags
let @h="yiWi<pa></Ea>Bf<i"

"t - Add markdown above [TODO]: # ()
let @t="o[TODO]: # ()i"

"c - compute arithmetic and paste after equals sign
let @c="yt=f=a=0"

"q - surround word in quotes
let @q="viwa\"hbi\"lel"

set tags=~/code/pico/pico-sdk/tags
