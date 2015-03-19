if has('win32')
  call plug#begin('$HOME/vimfiles/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" General
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'

" File management
" Unite
"   depend on vimproc
"   you have to go to vimproc.vim and do a ./make
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'rking/ag.vim'

" Visual
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kien/rainbow_parentheses.vim'

" Code Completion
Plug 'Shougo/neocomplcache.vim'

" Syntax Checker
Plug 'scrooloose/syntastic'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" MarkDown
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

" XML
Plug 'othree/xml.vim', { 'for': 'xml' }

" HTML/CSS
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'css' ] }

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

call plug#end()

"*****************************************************************************
" Basic Setup
"*****************************************************************************"
set nocompatible
set viminfo='20,\"50
set history=10000
set visualbell

" Fix backspace indent
set backspace=indent,eol,start

" allow plugins by file type
filetype on
filetype plugin on
filetype indent on

" Tabs. May be overriten by autocmd rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" indent
set autoindent
set smartindent
set cindent
set cinoptions=(0,u0,U0

" Map leader to ,
let mapleader='-'

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Directories for swp files
set nobackup
set noswapfile

set showcmd

if !has('win32')
  set shell=/bin/zsh
endif

set wildmode=list:longest,list:full

"*****************************************************************************
" Visual Settigns
"*****************************************************************************
syntax on
set ruler
set number
set nocursorline
set mousemodel=popup
set t_Co=256

let no_buffers_menu=1
highlight BadWhitespace ctermbg=red guibg=red

if has("gui_running")
  set guioptions=gmrti
	if has("win32")
		set gfn=Bitstream_Vera_Sans_Mono:h14
		autocmd GUIEnter * simalt ~x
	else
		set gfn=DejaVu_Sans_Mono_for_Powerline:h18
		set transparency=7
  endif
endif

set title
set titleold="Terminal"
set titlestring=%F

" solarized
try
  colorscheme solarized
catch
endtry

set background=dark
call togglebg#map("<F12>")

" Status bar
set laststatus=2

" airline
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline#extension#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#hunks#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#syntastic#enabled = 1

" Rainbow parenthesis options
let g:rbpt_colorpairs = [
	\ ['darkyellow',  'RoyalBlue3'],
	\ ['darkgreen',   'SeaGreen3'],
	\ ['darkcyan',    'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['DarkMagenta', 'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkyellow',  'DarkOrchid3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['DarkMagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkyellow',  'DarkOrchid3'],
	\ ['darkred',     'firebrick3'],
	\ ]

autocmd BufEnter *.js,*.scala RainbowParenthesesActivate
autocmd BufEnter *.js,*.scala RainbowParenthesesLoadRound
autocmd BufEnter *.js,*.scala RainbowParenthesesLoadSquare
autocmd BufEnter *.js,*.scala RainbowParenthesesLoadBraces

" Use modeline overrides
set modeline
set modelines=10

"*****************************************************************************
" Abbreviations
"*****************************************************************************
" no one is really happy until you have this shortcuts
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

"*****************************************************************************
" Key Mapping
"*****************************************************************************
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"*****************************************************************************
" Filetype
"*****************************************************************************
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"*****************************************************************************
" File management
"*****************************************************************************
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :vsplit<cr> :<C-u>Unite -start-insert file_rec/async<cr>
nnoremap <space>f :split<cr> :<C-u>Unite file<cr>
nnoremap <space>g :split<cr> :<C-u>Unite -start-insert file_rec/git<cr>
" make a grep on all files!
nnoremap <space>/ :split<cr> :<C-u>Unite grep:.<cr>
" see the yank history
nnoremap <space>y :split<cr>:<C-u>Unite history/yank<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" --- type ¡Æ to search the word in all files in the current dir
nmap <Leader>ag :Ag <c-r>=expand("<cword>")<cr><cr>

"*****************************************************************************
" Auto Completion
"*****************************************************************************
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
if has('win32')
  let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/_viminfo'
    \ }
else
  let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
    \ }
endif

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"*****************************************************************************
" Syntax Checker
"*****************************************************************************
" syntastic general
let g:syntastic_mode_map = {
	\ "mode": "active",
	\ "active_filetypes": [],
	\ "passive_filetypes": ["javascript", "scala"] }
let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" scala
let g:syntastic_scala_checkers=['fsc']

" map
nmap <Leader>sc :SyntasticCheck<CR>

"*****************************************************************************
" Plugins
"*****************************************************************************
" easymotion
"map <Leader> <Plug>(easymotion-prefix)

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>n <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0

" easy-align
vnoremap <silent> <Enter> :EasyAlign<cr>
