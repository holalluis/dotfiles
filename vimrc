" vim: set foldmethod=marker foldlevel=99 nomodeline:
" ============================================================================
" LLUÍS BOSCH'S .VIMRC {{{
" ============================================================================
"   https://github.com/holalluis/dotfiles
"   bash alias -> vimrc='vim ~/dotfiles/vimrc'

let s:darwin = has('mac')

" }}}
" ============================================================================
" PLUGINS (VIM-PLUG) {{{
" ============================================================================

call plug#begin('~/.vim/plugged')
  " PROVAR: (futur)
  " Plug 'airblade/vim-gitgutter' "same as vim-signify

  "COLORS: colorscheme
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
  nnoremap <leader>F :FZF<cr>

  " ----------------------------------------------------------------------------
  " fzf.vim   fzf fuzzy finder wrapper
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
  nnoremap <silent> <Leader>C       :Colors<CR>
  nnoremap <silent> <Leader><Enter> :Buffers<CR>
  nnoremap <silent> <Leader>L       :Lines<CR>

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
  " TODO try
  " ----------------------------------------------------------------------------
  Plug 'neoclide/coc.nvim',{'branch':'release'}
  "CONFIG COPYPASTED FROM COC.VIM README
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  "inoremap <silent><expr> <c-space> coc#refresh()
  "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  "nmap <silent> [g <Plug>(coc-diagnostic-prev)
  "nmap <silent> ]g <Plug>(coc-diagnostic-next)
  "nmap <silent> gd <Plug>(coc-definition)
  "nmap <silent> gy <Plug>(coc-type-definition)
  "nmap <silent> gi <Plug>(coc-implementation)
  "nmap <silent> gr <Plug>(coc-references)
  "nnoremap <silent> K :call <SID>show_documentation()<CR>
  "nmap <leader>rn <Plug>(coc-rename)
  "xmap <leader>f  <Plug>(coc-format-selected)
  "nmap <leader>f  <Plug>(coc-format-selected)
  "xmap <leader>a  <Plug>(coc-codeaction-selected)
  "nmap <leader>a  <Plug>(coc-codeaction-selected)
  "nmap <leader>ac  <Plug>(coc-codeaction)
  "nmap <leader>qf  <Plug>(coc-fix-current)
  "xmap if <Plug>(coc-funcobj-i)
  "xmap af <Plug>(coc-funcobj-a)
  "omap if <Plug>(coc-funcobj-i)
  "omap af <Plug>(coc-funcobj-a)
  "nmap <silent> <C-d> <Plug>(coc-range-select)
  "xmap <silent> <C-d> <Plug>(coc-range-select)
  "nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  "nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  "nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  "nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  "nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  "nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  "nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  "nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
  "set hidden
  "set nobackup
  "set nowritebackup
  "set cmdheight=2
  "set updatetime=300
  "set shortmess+=c
  "set signcolumn=yes
  "autocmd CursorHold * silent call CocActionAsync('highlight')
  "augroup mygroup
  "  autocmd!
  "  " Setup formatexpr specified filetype(s).
  "  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "  " Update signature help on jump placeholder
  "  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  "augroup end
  "command! -nargs=0 Format :call CocAction('format')
  "command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  "command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
  "set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
  " TODO per provar
  " ----------------------------------------------------------------------------
  "Plug 'tpope/vim-rhubarb'

  " ----------------------------------------------------------------------------
  " vim-signify | live git diff
  " ----------------------------------------------------------------------------
  " :SignifyEnable
  " :SignifyDisable
  " ----------------------------------------------------------------------------
  Plug 'mhinz/vim-signify'
  " disable signify by default
  let g:signify_disable_by_default = 1

  " ----------------------------------------------------------------------------
  " vim-github_dashboard | veure esdeveniments github
  " ----------------------------------------------------------------------------
  " :GHDashboard
  " :GHDashboard USER
  " :GHActivity
  " :GHActivity USER
  " :GHActivity USER/REPO
  " ----------------------------------------------------------------------------
  Plug 'junegunn/vim-github-dashboard'
  let g:github_dashboard={'username':'holalluis'}

  " ----------------------------------------------------------------------------
  " NERD Tree | file explorer
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

"colors
colorscheme molokai
"colorscheme gruvbox
"colorscheme Tomorrow-Night
"colorscheme default

"esborra autocmd anteriors
"auto reload vimrc
autocmd!
autocmd BufWritePost vimrc source ~/dotfiles/vimrc

"settings
set colorcolumn=80 "0
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
" Mou línies amb CTRL-hjkl
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
nnoremap <leader>r :source ~/dotfiles/vimrc<cr>

"edit alternate buffer (useful!)
nnoremap <leader><leader> :e#<cr>

"resyntax current file
nnoremap <leader>s :syntax sync fromstart<cr>

"invoca make
nnoremap <leader>m :make -k -j4<cr><cr>

"zoom amb <leader>z, com al tmux
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
command! Vimrc          :tabnew ~/dotfiles/vimrc       "edit vimrc in a new tab
command! Org            :tabnew ~/Dropbox/org/lluis.md "open org file in a new tab
command! Apunts         :tabnew ~/Desktop/apunts       "obre carpeta apunts
command! Mates          :tabnew ~/Desktop/mates        "obre carpeta matemàtiques
command! Bash           :w | :terminal bash %
command! Node           :w | :terminal node %
command! Python         :w | :terminal python3 %

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
