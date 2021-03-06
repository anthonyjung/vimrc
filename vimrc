if has('win32')
  call plug#begin('$HOME/vimfiles/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" General
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'

" File management
" Unite
"   depend on vimproc
"   you have to go to vimproc.vim and do a ./make
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'rking/ag.vim'

" Visual
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kien/rainbow_parentheses.vim'
Plug 'zenorocha/dracula-theme'

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

" JSON
Plug 'elzr/vim-json', { 'for': 'json' }

" CPP
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

" Go lang
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'garyburd/go-explorer', { 'for': 'go' }

" HTML/CSS
Plug 'mattn/emmet-vim'

" Jade
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" Typescript
Plug 'leafgarland/typescript-vim'

" Python
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'klen/python-mode', { 'for': 'python' }

" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

" Dockerfile
Plug 'ekalinin/Dockerfile.vim'

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
set lines=46
set columns=240

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

" colorscheme
try
  colorscheme dracula
catch
endtry

" Status bar
set laststatus=2

" airline
let g:airline_theme = 'molokai'
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

autocmd BufEnter *.json,*.js,*.scala RainbowParenthesesActivate
autocmd BufEnter *.json,*.js,*.scala RainbowParenthesesLoadRound
autocmd BufEnter *.json,*.js,*.scala RainbowParenthesesLoadSquare
autocmd BufEnter *.json,*.js,*.scala RainbowParenthesesLoadBraces

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
autocmd! BufNewFile,BufReadPost *.md set filetype=markdown
autocmd! BufRead,BufNewFile *.json set filetype=json
autocmd! BufNewFile,BufReadPost *.jade set filetype=jade
autocmd! BufNewFile,BufReadPost CMakeLists.txt set filetype=cmake
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq21
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

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

" --- type �� to search the word in all files in the current dir
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
	\ "mode": "passive",
	\ "active_filetypes": [],
	\ "passive_filetypes": ["html", "javascript", "scala"] }
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
" nerdtree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

" tagbar
nmap <F8> :TagbarToggle<CR>

" easymotion
"map <Leader> <Plug>(easymotion-prefix)

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0

" easy-align
vnoremap <silent> <Enter> :EasyAlign<cr>

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)

au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)

au FileType go nmap <leader>s <Plug>(go-implements)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
