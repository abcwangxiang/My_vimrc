" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
" Also switch on highlighting the last used search pattern.
syntax on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

"Set to auto read when a file is changed from the outside
if exists("&autoread")
	set autoread
endif

"set ignorecase
set cursorline
set showmatch
set nu
set ai
set si
set shiftwidth=8
set tabstop=8
set cindent
set incsearch
set hlsearch
"set cc=81

"TagList configuration
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Left_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 25
let Tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
map <F8> : Tlist<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""NERDTree
"NERDTree
let NERDTreeQuitOnOpen = 0
let NERDChristmasTree = 1
let NERDTreeShowHidden = 1
map <F7> : NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""
"WindowManager
"""""""""""""""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = "FileExplorer|TagList"
let g:winManagerWindowLayout = "TagList"
let g:winManagerWidth = 25
let g:defaultExplorer = 0
let g:persistentBehaviour = 0
""map <F2> :WMToggle<CR>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-f> :FirstExplorerWindow<cr>

colorscheme desert

set laststatus=2

set statusline=%<%f%h%m%r\ [%{&ff}]\ [%Y]%=[%b]\ [0x%B]\ %l,%c%V\ %P\ %{strftime(\"%b\ %d\ %a\ %H:%M\")}
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" For tab ops
map <c-w>, :tabp<cr>
map <c-w>. :tabn<cr>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set nobackup
set nowritebackup

set tags=tags

"设置多文件查找，递归搜索目录
map <F6> :call Search_Word()<CR>
function Search_Word()
	let w = expand("<cword>")   "在当前光标抓词
	"execute "grep " .w. "*.c"
	execute "!grep /" .w. "/j " ."**\*.cpp **\*.c **\*.h **\*.txt"
	botrigh copen
endfunction

