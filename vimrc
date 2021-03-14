let mapleader=","
" Set to enable all Vim features
set nocompatible
" Set PCRE regex instead of using Vim regex
nnoremap / /\v
vnoremap / /\v

" Minimal numbers of lines above and below cursor
set scrolloff=5
" Indicates fast terminal connection.
" Can improve smoothness.
set ttyfast
" Always show status window
set laststatus=2
" Show relative line number
set relativenumber
" Show last command
set showcmd
" Show current insert mode at the bottom of the screen
set showmode
set cursorline
" Set true color support
set termguicolors
" Enable syntax
syntax enable
" Setting tab to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Copy indent from previous line
set autoindent
" Indentation based on code syntax
" Does not interfere with autoindent
set smartindent
" Load filetype-specific indent files
filetype indent on
" Visual autocomplete for command menu
set wildmenu
set wildcharm=<C-Z>

" keep 200 lines of command line history
set history=200
" show the cursor position all the timeset ruler
set ruler
" Show @@@ in the last line if it is truncated
set display=truncate
" Set clipboard as a default register
set clipboard^=unnamed
" Fix for color breaks. It disable Vim Background Color Erase.
set t_ut=""
" Add insert line bindings for normal mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" Time to wait for mappings
set timeout timeoutlen=1000
" Time to wait for key codes
set ttimeout ttimeoutlen=10
" Select last changed/yanked text
nnoremap <leader>v V`]


" Long line handling
"==============================================================
" Soft wrap long lines
set wrap
" Wrap on words
set linebreak
" Max width of text that being inserted
set textwidth=79
" Auto formatting options
set formatoptions=qrn1
set colorcolumn=85


" Search and substitution
"===============================================================
" Search as characters are entered
set incsearch
" Highlight matches
set hlsearch
" Clear search highlight to the next search
nnoremap <silent> <Leader><space> :nohlsearch<cr>
" Intelligent case. All lower case will be case insensitive,
" but if any character will be upper search will be case sensitivie.
set ignorecase
set smartcase

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Applies substitutions globally on line
set gdefault


" Buffer
"================================================================
" Allow to switch buffer when current one have unsaved changes
set hidden
" Mappings to access buffers (don't use "<Leader>p" because a
" delay before pressing "p" would accidentally paste).
" <Leader>q	   : close buffer
" <Leader>l    : list buffers
" <Leader>g    : last-used
" <Leader>1 <Leader>2 <Leader>3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>q :bd<CR>


" Theme configuration
"===================================================================
set background=dark
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_hls_cursor='blue'
colorscheme gruvbox

" Backup and undo
"=====================================================================
if has("vms")
	" do not keep a backup file, use versions instead
	set nobackup
else
	" keep a backup file (restore to previous version)	
	set directory=~/.vim/.temp/swp
	set backupdir=~/.vim/.temp/backup//
	if has('persistent_undo')
		" keep an undo file (undo changes after closing)
		set undofile
		set undodir=~/.vim/.temp/undo
	endif
endif


" Autocommand group
"=======================================================================
" ":augroup vimStartup | au! | augroup END"
augroup vimStartup
	au!
	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid, when inside an event handler
	" (happens when dropping a file on gvim) and for a commit message (it's
	" likely a different one than last time).
	autocmd BufReadPost *
		\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
		\ |   exe "normal! g`\""
		\ | endif
augroup END

" Meta key fix
"======================================================================
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
