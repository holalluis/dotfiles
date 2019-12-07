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
" PLUGINS (VIM-PLUG) {{{
" ============================================================================
call plug#begin('~/.vim/plugged')

  "PROVANT:
  Plug 'scrooloose/nerdtree'     "file browsing
  Plug 'bling/vim-airline'       "nice status bar
  Plug 'plasticboy/vim-markdown' "syntax markdown

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
  " disabled by default
  let g:signify_disable_by_default = 1

  " ----------------------------------------------------------------------------
  " coc.nvim
  " ----------------------------------------------------------------------------
  " TODO
  " ----------------------------------------------------------------------------
  Plug 'neoclide/coc.nvim',{'branch':'release'}

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
set colorcolumn=0 "80 "110
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
set ttyfast
set synmaxcol=1000              "maxima columna per renderitzar sintaxi
set complete-=i                 "completion with CTRL-N and CTRL-P
set complete=.,w,b,u,t

if !has('nvim')
  set ttymouse=xterm2 "vim mouse support for tmux
endif

"clipboard
if has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

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
set nosmartindent
set noincsearch                 "incremental search
set nohidden                    "navega per arxius sense haver de guardar canvis
set nohlsearch

"better status line
"function! s:statusline_expr()
"  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
"  let ro  = "%{&readonly ? '[RO] ' : ''}"
"  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
"  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
"  let sep = ' %= '
"  let pos = ' %-12(%l : %c%V%) '
"  let pct = ' %P'
"  return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
"endfunction
"
"let &statusline = s:statusline_expr()

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

"netrw file explorer settings
let g:netrw_banner=0     "netrw disable banner
let g:netrw_liststyle=3  "netrw tree view

"misc
match ErrorMsg '\s\+$'                                        "ressalta trailing whitespaces
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set ft=groff "groff files
autocmd FileType * set formatoptions-=cro "desactivar auto comments

"COPIATS SENSE SABER QUE FAN: TODO
"set virtualedit=block
"set shortmess=aT
"set whichwrap=b,s
"set nojoinspaces
"set diffopt=filler,vertical
"set grepformat=%f:%l:%c:%m,%f:%l:%m
"set completeopt=menuone,preview
"silent! set cryptmethod=blowfish2
"if exists('&fixeol')
  "set nofixeol
"endif
"set formatoptions+=1
"if has('patch-7.3.541')
  "set formatoptions+=j
"endif
"if has('patch-7.4.338')
  "let &showbreak = '↳ '
  "set breakindent
  "set breakindentopt=sbr
"endif

" }}}
" ============================================================================
" NON-LEADER KEY MAPPINGS {{{
" ============================================================================

"kj escaping
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

" I type Wq more often than wq
cmap Wq wq

" Don't use Ex mode, use Q for formatting
map Q gq

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
" LEADER KEY MAPPINGS {{{
" ----------------------------------------------------------------------------
let mapleader=','

" PLUGIN LEADER MAPPINGS:
nnoremap <leader>f :FZF<cr>
nnoremap <leader>c :Colors<cr>
nnoremap <leader>q :NERDTreeToggle<cr>
nnoremap <leader>g :SignifyToggle<cr>
nnoremap <leader>n :Node<cr>

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
" }}}
" ============================================================================
" TEMPORAL {{{
" ============================================================================

" útil pel blog: convertir 'WORD' a '<inline>WORD</inline>'
command! SurroundWordWithInlineHTMLTag normal Bi<inline><esc>Ea</inline><esc>
nnoremap <leader>i :SurroundWordWithInlineHTMLTag<cr>

" }}}
" ============================================================================
" COC.NVIM configuration {{{
" ============================================================================

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" }}}
" ============================================================================
filetype plugin on
filetype indent off
syntax enable
