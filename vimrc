" vim: set foldmethod=marker foldlevel=99 nomodeline:
" ============================================================================
" LLUÍS BOSCH'S VIMRC {{{
" ============================================================================
" https://github.com/holalluis/dotfiles
" compatible with vim   & neovim
" compatible with macOs & linux
" useful bash alias:
"   alias vimrc='vim ~/dotfiles/vimrc'
" }}}

" ============================================================================
" PLUGINS (VIM-PLUG MANAGER) {{{
" ============================================================================
call plug#begin('~/.vim/plugged')
  "PROVANT:
  Plug 'godlygeek/tabular'

  "COLORS:
  Plug 'lifepillar/vim-solarized8'
  Plug 'tomasr/molokai'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'junegunn/seoul256.vim'
  Plug 'morhetz/gruvbox'

  "SYNTAX:
  Plug 'plasticboy/vim-markdown' "good markdown syntax

  "LSP: (language server protocol)
  "Plug 'prabirshrestha/asyncomplete.vim'
  "Plug 'prabirshrestha/async.vim'
  "Plug 'prabirshrestha/vim-lsp'
  "Plug 'prabirshrestha/asyncomplete-lsp.vim'

  "LANGUAGES LSP:
  "Plug 'ryanolsonx/vim-lsp-javascript'
  "Plug 'ryanolsonx/vim-lsp-python'

  "STATUS BAR:
  "Plug 'vim-airline/vim-airline'

  " ----------------------------------------------------------------------------
  " fzf     powerful fuzzy finder
  " ----------------------------------------------------------------------------
  " :FZF    start file fuzzy finder
  " ENTER   open result in current window
  " CTRL-T  open in new tab
  " CTRL-X  open in horizontal split
  " CTRL-V  open in vertical split
  " ----------------------------------------------------------------------------
  Plug 'junegunn/fzf',{'dir':'~/.fzf','do':'./install --all'}

  " ----------------------------------------------------------------------------
  " fzf.vim   fzf wrapper
  " ----------------------------------------------------------------------------
  " :Files    (same as :FZF) lists files in current folder
  " :Colors   lists colorschemes
  " :Buffers  lists open buffers
  " :Lines    lists all lines of code current buffers
  " :History  lists last files edited
  " :Marks    lists marks
  " :Ag       not sure exactly --> https://github.com/ggreer/the_silver_searcher
  " ----------------------------------------------------------------------------
  " Plug 'junegunn/fzf.vim'

  " ----------------------------------------------------------------------------
  " goyo.vim + limelight.vim | 2 plugins for distraction free writing
  " ----------------------------------------------------------------------------
  " :Goyo         toggle goyo
  " :Limelight    start limelight
  " :Limelight!   stop limelight
  " ----------------------------------------------------------------------------
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'

  " ----------------------------------------------------------------------------
  " vim-fugitive & vim-rhubarb (GIT AND GITHUB)
  " ----------------------------------------------------------------------------
  " :Gstatus
  " :Gdiff
  " :Gbrowse
  " ----------------------------------------------------------------------------
  "Plug 'tpope/vim-fugitive'
  "Plug 'tpope/vim-rhubarb'

  " ----------------------------------------------------------------------------
  " vim-signify | live git diff
  " ----------------------------------------------------------------------------
  " :SignifyEnable
  " :SignifyDisable
  " :SignifyToggle
  " ----------------------------------------------------------------------------
  "Plug 'mhinz/vim-signify'
  " disable signify by default
  "let g:signify_disable_by_default = 1

" plug#end() updates &runtimepath and initialize plugin system
" automatically executes `filetype plugin indent` on and `syntax enable`.
" Plugins become visible to Vim after this call.
call plug#end()

" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

"colors
colorscheme molokai
"colorscheme default
"colorscheme seoul256
"colorscheme gruvbox
"colorscheme Tomorrow-Night
"set background=dark | colorscheme solarized8

if has('nvim')
  set termguicolors
else
  set notermguicolors
endif

"esborra autocmd anteriors
autocmd!

"auto reload vimrc
autocmd BufWritePost vimrc source ~/dotfiles/vimrc

"settings
set guioptions=                 "no scrollbar in macvim
set colorcolumn=0               "80 110 línia vertical límit caràcters per línia
set autoindent                  "set auto indent on
set autoread                    "autoreload if it has been changed outside vim
set backspace=indent,eol,start  "backspace normal
set clipboard=unnamed           "system clipboard
set encoding=utf-8
set noignorecase nosmartcase    "do not ignore case searching
set laststatus=2                "veure titol finestra (2=sempre, 1=només si n'hi ha més d'una oberta)
set nolazyredraw
set listchars=eol:$             "makes 'set list' look prettier
set modeline
set modelines=5                 "modeline/modelines (:help modeline)
set nrformats=bin,hex           "C-a suma decimals i hexadecimals correctament "test: 0b0110001 63 0x4d
set number                      "show line number
set scrolloff=0                 "minimal number of screen lines to keep above and below the cursor (scroll offset)
set showcmd                     "mostra quina comanda estas escribint a baix a la dreta
set tags=tags                   "ctags(1) file
set textwidth=0
set timeoutlen=500              "timeout for commands
set visualbell
set wildmenu                    "display all matching files in tab complete
set wildmode=full
set equalalways                 "resize windows when opening new ones
set updatetime=100
set belloff=all                 "never ring bell
set display=lastline            "display @@@ at the end of long lines
set foldcolumn=0                "valors: 0 a 12, informació lateral sobre folds
set foldignore=                 "per defecte s'ignora caràcter '#' per folding, plega'l correctament (útil per CSS)
set foldlevel=10                "inicialment folds oberts
set foldmethod=indent           "manera de plegar text
set mouse=a                     "mouse support

set shiftround                  "use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2                "number of space character to use for indent
set smarttab                    "esborra tab amb <BS>
set tabstop=2                   "width of tab character
set expandtab                   "insert spaces instead of tab

set foldlevelstart=99
set ttyfast                     "removed in neovim
set synmaxcol=3000              "maxima columna per renderitzar sintaxi
set complete-=i                 "completion with CTRL-N and CTRL-P
set complete=.,w,b,u,t

"settings for vim only (not nvim)
if !has('nvim')
  set ttymouse=xterm2 "vim mouse support for tmux
  set signcolumn=no
endif

"clipboard (mac and linux)
if has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

"DESACTIVATS:
set nocompatible                "removed in neovim
set nolist                      "see invisible characters
set nostartofline               "keep the cursor on the same column
set nocursorline                "ilumina linia on hi ha el cursor
set nocursorcolumn              "ilumina columna on hi ha el cursor
set nopaste                     "prevents insert paste mode (fa coses rares)
set norelativenumber            "no relative number for line number
set noruler                     "show position always (no m'agrada)
set nowrap                      "les linies que surten de la pantalla no es veuen               asldkfj                                   alsdkfj                         laskdjfklj
set nosmartindent
set noincsearch                 "incremental search
set nohidden                    "navega per arxius sense haver de guardar canvis
set nohlsearch

"remember last position opening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"custom status line
"if !has('vim-airline')
"  function! s:statusline_expr()
"    let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
"    let ro  = "%{&readonly ? '[RO] ' : ''}"
"    let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
"    let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
"    let sep = ' %= '
"    let pos = ' %-12(%l : %c%V%) '
"    let pct = ' %P'
"    return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
"  endfunction
"  let &statusline = s:statusline_expr()
"  set laststatus=1
"endif

"annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

"underline urls | from https://gist.github.com/tobym/584909
highlight Url_underline term=underline cterm=underline ctermbg=black
match Url_underline 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*'

"netrw file explorer settings (don't need nerdtree)
let g:netrw_banner    = 0 "netrw disable banner
let g:netrw_liststyle = 3 "netrw tree view

"misc
match ErrorMsg '\s\+$' "ressalta trailing whitespaces
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set ft=groff "groff files
autocmd FileType * set formatoptions-=cro "desactivar auto comments
autocmd BufEnter Makefile set noexpandtab

" }}}
" ============================================================================
" NON-LEADER KEY MAPPINGS {{{
" ============================================================================

if !has('nvim')
  tmap <esc> <c-w>N
endif

"buscar centrant
nnoremap n nzz

"kj escaping
inoremap kj <Esc>
cnoremap kj <C-c>

"circular windows navigation with space
nnoremap <space> <C-w>w

"make Y behave like other capitals
nnoremap Y y$

"paste amb autoindent
nnoremap p ]p

"moure sense tenir en compte line wrapping
nnoremap j gj
nnoremap k gk

" I type Wq more often than wq
cmap Wq wq

" Don't use Ex mode, use Q for formatting
map Q gq

" ----------------------------------------------------------------------------
" Help in new tabs AND "q" for closing help
" ----------------------------------------------------------------------------
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd BufEnter *.txt call s:helptab()


" }}}
" ----------------------------------------------------------------------------
" LEADER KEY MAPPINGS {{{
" ----------------------------------------------------------------------------
let mapleader=','

" NATIVE VIM LEADER MAPPINGS:
nnoremap <leader>r        :source ~/dotfiles/vimrc<cr>
nnoremap <leader>s        :syntax sync fromstart<cr>
nnoremap <leader><leader> :e#<cr>
nnoremap <leader>m        :make -k -j4<cr><cr><cr>
nnoremap <leader>e        :Lexplore<cr>
nnoremap <leader>t :vertical terminal<cr>

nnoremap <leader>h        :set ft=html<cr>
nnoremap <leader>j        :set ft=javascript<cr>
nnoremap <leader>c        :set ft=css<cr>

" PLUGIN LEADER MAPPINGS:
nnoremap <leader>f  :FZF<cr>
nnoremap <leader>n  :Node<cr>
nnoremap <leader>p  :Python<cr>
nnoremap <leader>b  :Bash<cr>
nnoremap <leader>gs :Gstatus<cr>

" }}}
" ============================================================================
" FUNCTIONS AND COMMANDS {{{
" custom ex commands start with capital letter
" ----------------------------------------------------------------------------
command! TrimWhitespace :keeppatterns %s/\s\+$//e
command! Vimrc          :tabnew ~/dotfiles/vimrc       "edit vimrc in a new tab
command! Org            :tabnew ~/Dropbox/org/lluis.md "open org file in a new tab
command! Apunts         :tabnew ~/Desktop/apunts       "obre carpeta apunts
command! Mates          :tabnew ~/Desktop/mates        "obre carpeta matemàtiques
command! Bash           :w | :terminal bash %
command! Node           :w | :belowright :terminal node %
command! Python         :w | :terminal python3 %
command! Vs             :vs | :FZF

"convertir 'WORD' a <inline>'WORD'</inline>
command! SurroundWordWithInlineHTMLTag normal Bi<inline><esc>Ea</inline><esc>
nnoremap <leader>i :SurroundWordWithInlineHTMLTag<cr>

" }}}
" ============================================================================
" AUTOCOMPLETE CONFIG {{{
" ============================================================================

"MAPPINGS: per autocomplete / interacció amb pop up menu

"1. TAB does CTRL+n
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ <SID>type_Cn_and_refresh()

"funcions helper pel mapping anterior
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"return string '\<C-n>' and refresehes asyncomplete
function! s:type_Cn_and_refresh() abort
"  call asyncomplete#force_refresh()
  return "\<C-n>"
endfunction

"2. tecla Shift+TAB fa CTRL+p
"3. tecla Enter accepta opcio del pop up menu
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><cr>    pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" }}}
" ============================================================================
" LSP SERVERS LANGUAGES CONFIG {{{
" ============================================================================

"REGISTER PYTHON LSP: (pyls)
" pip install python-language-server
"if executable('pyls')
"  au User lsp_setup call lsp#register_server({
"    \ 'name': 'pyls',
"    \ 'cmd': {server_info->['pyls']},
"    \ 'whitelist': ['python'],
"    \ })
"endif

"REGISTER JAVASCRIPT LSP: (typescript-language-server)
" npm -g install typescript typescript-language-server
" perquè funcioni amb javascript és necessari tenir un arxiu "package.json"
"if executable('typescript-language-server')
"  au User lsp_setup call lsp#register_server({
"    \ 'name': 'javascript support using typescript-language-server',
"    \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"    \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
"    \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
"    \ })
"endif

" }}}
" ============================================================================
" TABULARIZE PLUGIN and tpope gist
" ============================================================================
" https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" ============================================================================
filetype plugin off
filetype indent off
syntax on
set showcmd
