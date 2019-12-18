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
  "Plug 'bling/vim-airline'       "nice status bar
  Plug 'plasticboy/vim-markdown' "good markdown syntax

  "LSP: (language server protocol)
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'

  "LANGUAGES LSP:
  "Plug 'ryanolsonx/vim-lsp-javascript'
  "Plug 'ryanolsonx/vim-lsp-python'

  "COLORS:
  Plug 'tomasr/molokai'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'junegunn/seoul256.vim'
  Plug 'morhetz/gruvbox'

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
  Plug 'junegunn/fzf.vim'

  " ----------------------------------------------------------------------------
  " goyo.vim + limelight.vim | distraction free writing
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
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'

  " ----------------------------------------------------------------------------
  " vim-signify | live git diff
  " ----------------------------------------------------------------------------
  " :SignifyEnable
  " :SignifyDisable
  " :SignifyToggle
  " ----------------------------------------------------------------------------
  Plug 'mhinz/vim-signify'
  " disable signify by default
  let g:signify_disable_by_default = 1

" plug#end() updates &runtimepath and initialize plugin system
" automatically executes `filetype plugin indent` on and `syntax enable`.
" Plugins become visible to Vim after this call.
call plug#end()

" }}}
" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================
" activar:    'set option'
" desactivar: 'set nooption'
" ============================================================================

"colors
"colorscheme default
colorscheme molokai
"colorscheme seoul256
"colorscheme gruvbox
"colorscheme tomorrow-night

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
set colorcolumn=0               "80 110 línia vertical límit caràcters per línia
set autoindent                  "set auto indent on
set autoread                    "autoreload if it has been changed outside vim
set backspace=indent,eol,start  "backspace normal
set clipboard=unnamed           "system clipboard
set encoding=utf-8
set ignorecase smartcase        "ignores case searching when lowercase only
set laststatus=2                "veure titol finestra (2=sempre, 1=només si n'hi ha més d'una oberta)
set lazyredraw
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
set expandtab smarttab          "insert spaces instead of tab
set foldlevelstart=99
set ttyfast                     "removed in neovim
set synmaxcol=1000              "maxima columna per renderitzar sintaxi
set complete-=i                 "completion with CTRL-N and CTRL-P
set complete=.,w,b,u,t

"settings for vim only (not nvim)
if !has('nvim')
  set ttymouse=xterm2 "vim mouse support for tmux
  set signcolumn=yes
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
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |exe "normal! g`\"" | endif

"custom status line
if !has('vim-airline')
  function! s:statusline_expr()
    let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
    let ro  = "%{&readonly ? '[RO] ' : ''}"
    let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
    let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
    let sep = ' %= '
    let pos = ' %-12(%l : %c%V%) '
    let pct = ' %P'
    return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
  endfunction
  let &statusline = s:statusline_expr()
  set laststatus=1
endif

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

" }}}
" ============================================================================
" NON-LEADER KEY MAPPINGS {{{
" ============================================================================

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

" ----------------------------------------------------------------------------
" "q" for closing terminal window (no funciona)
" ----------------------------------------------------------------------------
function! s:termtab()
  if &buftype == 'terminal'
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd BufNewFile * call s:termtab()

" }}}
" ----------------------------------------------------------------------------
" LEADER KEY MAPPINGS {{{
" ----------------------------------------------------------------------------
let mapleader=','

" PLUGIN LEADER MAPPINGS:
nnoremap <leader>f :FZF<cr>
nnoremap <leader>c :Colors<cr>
nnoremap <leader>g :SignifyToggle<cr>
nnoremap <leader>n :Node<cr>
nnoremap <leader>p :Python<cr>
nnoremap <leader>b :Bash<cr>

" NATIVE VIM LEADER MAPPINGS:
nnoremap <leader>r        :source ~/dotfiles/vimrc<cr>
nnoremap <leader>s        :syntax sync fromstart<cr>
nnoremap <leader><leader> :e#<cr>
nnoremap <leader>m        :make -k -j4<cr><cr>

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
command! Node           :w | :terminal node %
command! Python         :w | :terminal python3 %

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

"2. Shift+TAB does CTRL+p
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"3. Enter accepts selection from popup menu
inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"auto complete by default?
let g:asyncomplete_auto_popup = 1

"helper for previous mappings
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"return string '\<C-n>' and refresehes asyncomplete
function! s:type_Cn_and_refresh() abort
  call asyncomplete#force_refresh()
  return "\<C-n>"
endfunction

" }}}
" ============================================================================
" LSP SERVERS LANGUAGES CONFIG {{{
" ============================================================================

"REGISTER PYTHON LSP: (pyls)
" pip install python-language-server
if executable('pyls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
endif

"REGISTER JAVASCRIPT LSP: (typescript-language-server)
" npm -g install typescript typescript-language-server
" perquè funcioni amb javascript és necessari tenir un arxiu "package.json"
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'javascript support using typescript-language-server',
    \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
    \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
    \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
    \ })
endif

" }}}
" ============================================================================
filetype plugin off
filetype indent off
syntax on
