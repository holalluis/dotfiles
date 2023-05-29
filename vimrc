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

" ============================================================================
" PLUGINS (VIM-PLUG MANAGER) {{{
" ============================================================================
call plug#begin('~/.vim/plugged')
  "PROVANT:
  if !has('nvim')
    Plug 'vim/killersheep' ":KillKillKill
  endif

  "Plug 'madox2/vim-ai'

  "TABULARIZE:
  Plug 'godlygeek/tabular' ":Tabularize

  "COLORS:
  Plug 'itchyny/landscape.vim'
  Plug 'lifepillar/vim-solarized8'
  Plug 'tomasr/molokai'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'junegunn/seoul256.vim'
  Plug 'morhetz/gruvbox'
  Plug 'ayu-theme/ayu-vim'
  Plug 'kaicataldo/material.vim', {'branch':'main'}
  Plug 'mhartington/oceanic-next'

  "SYNTAX:
  Plug 'plasticboy/vim-markdown' "good markdown syntax
  "Plug 'zah/nim.vim'

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

" ============================================================================
" TABS {{{
" ============================================================================
" from https://vim.fandom.com/wiki/Show_tab_number_in_your_tab_line
if exists("+showtabline")
  function MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      "let s .= ' '
      "let s .= i . ')'
      let s .= '%*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let file = bufname(buflist[winnr - 1])
      let file = fnamemodify(file, ':p:t')
      if file == ''
        let file = '[No Name]'
      endif
      let s .= ' '.file.' '
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=1
  set tabline=%!MyTabLine()
endif

" }}}
" ============================================================================

" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

"use native omnicompletion plugin
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \ if &omnifunc == "" |
    \ setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
  endif

"use :Man <program>
runtime ftplugin/man.vim

"for the :find command
"set path+=**

"executar comanda a bash amb la funció '='
"set equalprg=bash
set equalprg=

"executar comanda bash i enganxar output a sota (inspirat per acme text editor)
nnoremap gb :call Executa_linia_actual_a_bash()<CR>
function! Executa_linia_actual_a_bash()
  normal yy
  ":tabnew
  ".nnoremap <buffer> q :q!<cr>
  normal p
  :.!bash
endfunction

"obrir links sota el cursor, exemple: https://github.com/holalluis
nnoremap gx :call HandleURL_for_WSL()<CR>
function! HandleURL_for_WSL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;()]*')
  let s:uri = shellescape(s:uri, 1)
  echom s:uri
  if s:uri != ""
    silent exec "!bash /home/lluis/bin/open_url.sh '".s:uri."'"
    :redraw!
  else
    echo "No URI found in line."
  endif
endfunction

"colors
"set background=dark
"colorscheme default
"colorscheme molokai
"colorscheme seoul256
"colorscheme Tomorrow-Night
"colorscheme OceanicNext
"colorscheme ayu
"colorscheme solarized8_high
"colorscheme gruvbox
"colorscheme material
colorscheme landscape

"fix black and white colors
"not sure if this works
if has('nvim')
  set termguicolors
  colorscheme default
else
  set notermguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"esborra autocmd anteriors
autocmd!

"auto reload vimrc
autocmd BufWritePost vimrc source ~/dotfiles/vimrc

"settings
set lazyredraw
set showmode                    "show mode (INSERT, VISUAL) etc
set guicursor=                  "block cursor
set autoindent                  "set auto indent on
set autoread                    "autoreload if it has been changed outside vim
set backspace=indent,eol,start  "backspace normal
set belloff=all                 "never ring bell
set clipboard=unnamed           "system clipboard
set colorcolumn=0               "80 110 línia vertical límit caràcters per línia
set complete-=i                 "completion with CTRL-N and CTRL-P
set complete=.,w,b,u,t
set encoding=utf-8
set equalalways                 "resize windows when opening new ones
set expandtab                   "insert spaces instead of tab
set foldcolumn=0                "valors: 0 a 12, informació lateral sobre folds
set foldignore=                 "per defecte s'ignora caràcter '#' per folding, plega'l correctament (útil per CSS)
set foldlevel=10                "inicialment folds oberts
set foldlevelstart=99
set foldmethod=indent           "manera de plegar text
set guioptions=                 "no scrollbar in macvim
set laststatus=1                "veure titol finestra (2=sempre, 1=només si n'hi ha més d'una oberta)
set listchars=eol:$             "makes 'set list' look prettier
set modeline
set modelines=5                 "modeline/modelines (:help modeline)
set mouse=a                     "mouse support
set nrformats=bin,hex           "C-a suma decimals i hexadecimals correctament "test: 0b0110001 63 0x4d
set number                      "show line number
set scrolloff=0                 "minimal number of screen lines to keep above and below the cursor (scroll offset)
set shiftround                  "use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2                "number of space character to use for indent
set showcmd                     "mostra quina comanda estas escribint a baix a la dreta
set smarttab                    "esborra tab amb <BS>
set synmaxcol=3000              "maxima columna per renderitzar sintaxi
set tabstop=2                   "width of tab character
set tags=tags                   "ctags(1) file
set textwidth=0
set timeoutlen=500              "timeout for commands
set ttyfast                     "removed in neovim
set updatetime=100
set visualbell
set wildmenu                    "display all matching files in tab complete
set wildmode=full

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
set nocompatible     "removed in neovim
set nocursorcolumn   "ilumina columna on hi ha el cursor
set nocursorline     "ilumina linia on hi ha el cursor
set nohidden         "navega per arxius sense haver de guardar canvis
set nohlsearch
set noignorecase
set noincsearch      "incremental search
set nolist           "see invisible characters
set nopaste          "prevents insert paste mode (fa coses rares)
set norelativenumber "relative number for line number
set noruler          "show position always (no m'agrada)
set nosmartcase
set nosmartindent
set nostartofline    "keep the cursor on the same column
set nowrap           "les linies que surten de la pantalla no es veuen               asldkfj                                   alsdkfj                         laskdjfklj

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
let g:netrw_banner    = 1 "netrw banner (0 to disable, 1 enable)
let g:netrw_liststyle = 3 "netrw tree view

"ressalta trailing whitespaces a final de línia
match ErrorMsg '\s\+$'

"syntax for groff files
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set ft=groff

"syntax for vue files
autocmd BufRead,BufNewFile *.vue set ft=html

"desactivar auto comments
autocmd FileType * set formatoptions-=cro

"no posar espais als makefiles
autocmd BufEnter Makefile set noexpandtab

" }}}
" ============================================================================

" ============================================================================
" NON-LEADER KEY MAPPINGS {{{
" ============================================================================

"escape terminal mode
if has('nvim')
  tnoremap kj <C-\><C-n>
else
  tnoremap kj <c-w>N
endif

"buscar centrant
nnoremap n nzz

"kj escaping
inoremap kj <Esc>
cnoremap kj <C-c>

"navegar per les finestres apretant espai
nnoremap <space> <C-w>w
nnoremap <C-space> <C-w>W

"make Y behave like other capitals
nnoremap Y y$

"paste amb autoindent
nnoremap p ]p

"moure sense tenir en compte line wrapping
nnoremap j gj
nnoremap k gk

"I type Wq more often than wq: remap typo
cmap Wq wq

"Don't use Ex mode, use Q for formatting
map Q gq

" ----------------------------------------------------------------------------
" Help in new tabs AND "q" for closing help
" ----------------------------------------------------------------------------
autocmd BufEnter *.txt call s:helptab()
function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction

" }}}
" ============================================================================

" ============================================================================
" LEADER KEY MAPPINGS {{{
" ----------------------------------------------------------------------------
let mapleader=','

" NATIVE VIM LEADER MAPPINGS:
nnoremap <leader>a        :@:<cr>
nnoremap <leader>t        :belowright :vertical :terminal<cr>

nnoremap <leader>ñ        /<C-r>"<cr>
nnoremap <leader><leader> :e#<cr>

nnoremap <leader>e        :20Lexplore<cr>
nnoremap <leader>m        :make -k -j4<cr>
nnoremap <leader>s        :syntax sync fromstart<cr>
nnoremap <leader>r        :source ~/dotfiles/vimrc<cr>

nnoremap <leader>h        :set ft=html<cr>
nnoremap <leader>j        :set ft=javascript<cr>
nnoremap <leader>c        :set ft=css<cr>

"compilar i executar rust project
nnoremap <leader>c :CargoRun<cr>
command! CargoRun :w | :terminal cargo run

"compilar i executar go project
nnoremap <leader>g :GoRun<cr>
command! GoRun :w | :belowright :terminal go run %

"executar arxiu python actual
nnoremap <leader>p :Python<cr>
"command! Python :w | :belowright :terminal python3 %
command! Python :w | :vertical :belowright :terminal /mnt/c/Users/lluis/AppData/Local/Programs/Python/Python310/python.exe %

"executar arxiu javascript actual
nnoremap <leader>n :Node<cr>
command! Node :w | :vertical :belowright :terminal node --no-warnings %

"executar shell script actual
nnoremap <leader>b :Bash<cr>
command! Bash :w | :terminal bash %

"executar shell script actual
nnoremap <leader>l :Lisp<cr>
command! Lisp :w | :terminal clisp --silent %

command! Rscript :w | :terminal Rscript %

"FZF fuzzy file finder (junegunn/fzf)
nnoremap <leader>f :FZF<cr>

"open file explorer in Windows WSL
command! Open :terminal /mnt/c/Windows/explorer.exe \.
nnoremap <leader>o :Open<cr>

" }}}
" ============================================================================

" ============================================================================
" FUNCTIONS AND COMMANDS {{{
" custom ex commands start with capital letter
" ----------------------------------------------------------------------------
command! TrimWhitespace :keeppatterns %s/\s\+$//e
command! Vimrc          :tabnew ~/dotfiles/vimrc "edit vimrc in a new tab
command! TmuxConf       :tabnew ~/dotfiles/tmux.conf "edit tmux.conf in a new tab
command! Bashrc         :tabnew ~/.bash_aliases  "edit bashrc file
command! TasquesIcra    :tabnew ~/org/icra.md    "edit file in a new tab
command! Org            :tabnew ~/org/lluis.md   "edit file in a new tab
command! Vs             :vs | :FZF

"convertir 'WORD' a <inline>'WORD'</inline>
command! SurroundWordWithInlineHTMLTag normal Bi<b><esc>Ea</b><esc>
nnoremap <leader>i :SurroundWordWithInlineHTMLTag<cr>

" }}}
" ============================================================================

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

"return string '\<C-n>' and refresh asyncomplete
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

" ============================================================================
" TABULARIZE PLUGIN and tpope gist {{{
" ============================================================================
" https://gist.github.com/tpope/287147
" it is called when "|" is typed
" }}}
" ============================================================================

filetype plugin off
filetype indent off
syntax on
set showcmd
