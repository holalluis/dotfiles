" vim: set foldmethod=marker foldlevel=99 nomodeline:
" ============================================================================
" LLUÍS BOSCH'S .VIMRC {{{
" ============================================================================
"   https://github.com/holalluis/vimrc
"   bash alias -> vimrc='vim ~/vimrc/vimrc'
" }}}
" ============================================================================
" PLUGINS (VIM-PLUG) {{{
" ============================================================================

call plug#begin('~/.vim/plugged')
  "COLORS:
  Plug 'tomasr/molokai'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'junegunn/seoul256.vim'

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
  nnoremap <leader>f :FZF<cr>

  " ----------------------------------------------------------------------------
  " fzf.vim   fzf fuzzy finder wrapper
  " ----------------------------------------------------------------------------
  " :Files    lists files in current folder (same as :FZF)
  " :Colors   lists colors
  " :Buffers  lists buffers
  " :Lines    lists lines of current buffers
  " :History  lists last files edited
  " :Marks    lists marks
  " :Ag       https://github.com/ggreer/the_silver_searcher
  " ----------------------------------------------------------------------------
  Plug 'junegunn/fzf.vim'
  nnoremap <silent> <Leader>C        :Colors<CR>
  nnoremap <silent> <Leader><Enter>  :Buffers<CR>
  nnoremap <silent> <Leader>L        :Lines<CR>

  " ----------------------------------------------------------------------------
  " goyo.vim + limelight.vim | distraction free writing
  " ----------------------------------------------------------------------------
  " :Goyo         toggle goyo
  " :Limelight    start limelight
  " :Limelight!   stop limelight
  " ----------------------------------------------------------------------------
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  nnoremap <Leader>G :Goyo<CR>

  " ----------------------------------------------------------------------------
  " vim-emoji :dog: :cat: :rabbit:!
  " ----------------------------------------------------------------------------
  Plug 'junegunn/vim-emoji'
  command! -range EmojiReplace <line1>,<line2>s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g

  " EDITING:
  " ----------------------------------------------------------------------------
  " vim-commentary
  " ----------------------------------------------------------------------------
  Plug 'tpope/vim-commentary'
  map  gc  <Plug>Commentary
  nmap gcc <Plug>CommentaryLine

  " ----------------------------------------------------------------------------
  " coc.nvim
  " ----------------------------------------------------------------------------
  " TODO explore deeper
  " ----------------------------------------------------------------------------
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
  if has_key(g:plugs, 'coc.nvim')
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  endif

  "GIT AND GITHUB:
  " ----------------------------------------------------------------------------
  " vim-fugitive
  " ----------------------------------------------------------------------------
  " :Gstatus
  " :Gdiff
  " ----------------------------------------------------------------------------
  Plug 'tpope/vim-fugitive'

  " ----------------------------------------------------------------------------
  " vim-rhubarb
  " ----------------------------------------------------------------------------
  " TODO explore deeper
  " ----------------------------------------------------------------------------
  Plug 'tpope/vim-rhubarb'

  " ----------------------------------------------------------------------------
  " vim-signify
  " ----------------------------------------------------------------------------
  " TODO explore deeper
  " :SignifyEnable
  " :SignifyDisable
  " ----------------------------------------------------------------------------
  Plug 'mhinz/vim-signify'

  " ----------------------------------------------------------------------------
  " vim-github_dashboard
  " ----------------------------------------------------------------------------
  " TODO explore deeper
  " ----------------------------------------------------------------------------
  Plug 'junegunn/vim-github-dashboard'
  let g:github_dashboard={'username':'holalluis'}

  " ----------------------------------------------------------------------------
  " NERD Tree
  " ----------------------------------------------------------------------------
  " :NERDTreeToggle
  " q for closing
  " ----------------------------------------------------------------------------
  Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}
  nnoremap <leader>n :NERDTreeToggle<cr>
  augroup nerd_loader
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd BufEnter,BufNew *
      \  if isdirectory(expand('<amatch>'))
      \|   call plug#load('nerdtree')
      \|   execute 'autocmd! nerd_loader'
      \| endif
  augroup END
call plug#end()

" }}}
" ============================================================================
" BASIC SETTINGS {{{
" activar:    'set option'
" desactivar: 'set nooption'
" ============================================================================

"esborra autocmd anteriors
"auto reload vimrc
autocmd!
autocmd BufWritePost vimrc source ~/vimrc/vimrc

"color :Colors
colorscheme seoul256 "default

"settings
set colorcolumn=0 "80
set autoindent                  "set auto indent on
set autoread                    "auto reload file if it has been changed outside vim
set backspace=indent,eol,start  "backspace normal
set clipboard=unnamed           "system clipboard
set encoding=utf-8
set hidden                      "navega per arxius sense haver de guardar canvis
set nohlsearch
set ignorecase smartcase        "smartcase ignores case when searches using lowercase only
set noincsearch                 "incremental search
set laststatus=2                "veure titol finestra (2=sempre, 1=només si n'hi ha més d'una oberta)
set lazyredraw
set listchars=eol:$             "makes 'set list' look prettier
set modeline
set modelines=5                 "modeline/modelines (:help modeline)
set nrformats=bin,hex           "C-a suma decimals i hexadecimals correctament "test: 0b0101111 61 0x51
set number                      "show line number
set scrolloff=0                 "minimal number of screen lines to keep above and below the cursor (scroll offset)
set showcmd                     "mostra quina comanda estas escribint a baix a la dreta
set smartindent
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
set foldignore=                 "ignora caràcter '#' per folding, plega'l correctament (útil per CSS)
set foldlevel=10                "inicialment folds oberts
set foldmethod=indent           "manera de plegar text
set mouse=a                     "mouse support
set ttymouse=xterm2            "mouse support for tmux
set shiftround                  "use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2                "number of space character to use for indent
set smarttab                    "esborra tab amb <BS>
set tabstop=2                   "width of tab character
set expandtab smarttab          "insert spaces instead of tab
set foldlevelstart=99
set ttyfast
set synmaxcol=1000              "maxima columna per renderitzar sintaxi
set complete-=i                 "completion with CTRL-N and CTRL-P
"set complete=.,w,b,u,t

"DESACTIVATS:
set nolist                      "see invisible characters
set nostartofline               " Keep the cursor on the same column
set nocursorline                "ilumina linia on hi ha el cursor
set nocursorcolumn              "ilumina columna on hi ha el cursor
set nocompatible                "more useful vim
set nopaste                     "prevents insert paste mode (fa coses rares)
set norelativenumber            "no relative number for line number
set noruler                     "show position always (no m'agrada)
set nowrap                      "les linies que surten de la pantalla no es veuen

"better status line
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

"annoying temporary files
set backupdir=/tmp//,.
set directory=/tmp//,.
if v:version >= 703
  set undodir=/tmp//,.
endif

"remember last position opening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |exe "normal! g`\"" | endif

"underline urls | from https://gist.github.com/tobym/584909
highlight Url_underline term=underline cterm=underline ctermbg=black
match Url_underline 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*'

"netrw file explorer
let g:netrw_banner=0     "netrw disable annoying banner
let g:netrw_liststyle=3  "netrw tree view

"autocmd FileType * set formatoptions-=cro                    "desactivar auto comments
match ErrorMsg '\s\+$'                                        "ressalta trailing whitespaces
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set ft=groff "groff files

"COPIATS SENSE SABER QUE FAN: TODO
set virtualedit=block
set shortmess=aIT
set whichwrap=b,s
set nojoinspaces
set diffopt=filler,vertical
set grepformat=%f:%l:%c:%m,%f:%l:%m
set completeopt=menuone,preview
silent! set cryptmethod=blowfish2

if exists('&fixeol')
  set nofixeol
endif

set formatoptions+=1
if has('patch-7.3.541')
  set formatoptions+=j
endif

if has('patch-7.4.338')
  let &showbreak = '↳ '
  set breakindent
  set breakindentopt=sbr
endif

" }}}
" ============================================================================
" MAPPINGS {{{
" ============================================================================

"kj escaping!
inoremap kj <Esc>
cnoremap kj <C-c>

"<space> circular windows navigation
nnoremap <space> <C-w>w

"make Y behave like other capitals
nnoremap Y y$

"paste amb autoindent
nnoremap p ]p

"moure sense tenir en compte line wrapping
nnoremap j gj
nnoremap k gk

" ----------------------------------------------------------------------------
" Moving lines with CTRL-hjkl
" ----------------------------------------------------------------------------
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv

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
" LEADER KEY MAPPINGS: {{{
" ----------------------------------------------------------------------------

let mapleader     =','
let maplocalleader=','

"recarrega vimrc
nnoremap <leader>r :source ~/vimrc/vimrc<cr>

"edit alternate buffer (useful!)
nnoremap <leader><leader> :e#<cr>

"resyntax current file
nnoremap <leader>s :syntax sync fromstart<cr>

"invoke make
nnoremap <leader>m :make -k -j4<cr><cr>

" Zoom amb <leader>z, com al tmux
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" }}}
" ============================================================================
" FUNCTIONS AND COMMANDS {{{
" custom ex commands start with capital letter
" ----------------------------------------------------------------------------

command! TrimWhitespace :keeppatterns %s/\s\+$//e
command! Vimrc          :tabnew ~/vimrc/vimrc           "edit vimrc in a new tab
command! Bash           :w | :terminal bash %
command! Node           :w | :terminal node %
command! Python         :w | :terminal python3 %
command! Org            :tabnew ~/Dropbox/org/lluis.md  "open org file in a new tab
command! Apunts         :tabnew ~/Desktop/apunts        "obre carpeta apunts
command! Mates          :tabnew ~/Desktop/mates         "obre carpeta matemàtiques

" }}}
" ============================================================================
" TEMPORAL {{{
" ============================================================================

" blog: convertir 'WORD' a '<inline>WORD</inline>'
command! Surround normal Bi<inline><esc>Ea</inline><esc>
nnoremap <leader>i :Surround<cr>

" }}}
" ============================================================================
filetype plugin on
filetype indent on
syntax enable
