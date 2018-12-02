"VIMRC holalluis
"alias vimrc='vim ~/vimrc/vimrc'

"ZONA DE PROVES: "buit

"NEW COMMANDS: start with capital letter
  command! Vimrc  vsplit ~/vimrc/vimrc        "edita vimrc
  command! Apunts vsplit ~/Dropbox/org/apunts "obre apunts folder
  command! Node   w | terminal node   %       "exec current file in node
  command! Python w | terminal python %       "exec current file in python
  command! Bash   w | terminal bash   %       "exec current file in bash

"LEADER KEY MAPS: leader is comma
  "edit alternate buffer
  nnoremap ,a :e#<CR>
  "resyntax current file
  nnoremap ,s :syntax sync fromstart<CR>
  "open terminal
  nnoremap ,t :vertical terminal<CR>
  "vertical file explorer
  nnoremap ,e :vs.<CR>

"SETS: activar i desactivar
  "nmap ,n :tabnext<cr>           "es pot fer amb gt
  "nmap ,p :tabprev<cr>           "es pot fer amb gT
  "set textwidth=80               "set text width
  "set colorcolumn=+1             "set color column
  "set autochdir                  "canviar pwd automaticament
  "set foldmethod=manual          "manera de plegar text
  "set nofoldenable               "inicialment folds oberts
  set autoindent
  set backspace=indent,start,eol  "proper backspace
  set clipboard=unnamed           "system clipboard

  set expandtab                   "insert spaces instead of tab
  set foldignore=                 "ignora caràcter '#' per folding, plega'l correctament (útil per CSS)
  set shiftround   "use multiple of shiftwidth when indenting with '<' and '>'
  set shiftwidth=2 "number of space character to use for indent
  set tabstop=2    "width of tab character

  set foldcolumn=0                "valors: 0 a 12, informacio lateral sobre folds
  set foldlevel=10                 "inicialment folds oberts
  set foldmethod=indent           "manera de plegar text
  set history=200                 "history of ':' commands, and history of previous search patterns
  set laststatus=1                "veure titol finestra (2=sempre, 1=només si n'hi ha més d'una oberta)
  set listchars=eol:$             "makes 'set list' look prettier
  set modelines=5                 "modeline/modelines (:help modeline)
  set mouse=a                     "mouse support
  set nocompatible                "more useful vim
  set nocursorcolumn              "ilumina columna del cursor
  set nocursorline                "ilumina linia del cursor
  set nohidden                    "navega per finestres sense haver de guardar canvis (no m'agrada)
  set nohlsearch                  "hl search
  set noincsearch                 "incremental search
  set nolist                      "see invisible characters
  set norelativenumber            "no relative number for line number
  set noruler                     "show position always (no m'agrada)
  set nowrap                      "les linies que surten de la pantalla no es veuen
  set nrformats=bin,hex           "C-a suma decimals i hexadecimals correctament "test: 0b0101111 61 0x51
  set number                      "show line number
  set path+=**                    "(** searches subdirectories)
  set scrolloff=0                 "minimal number of screen lines to keep above and below the cursor (scroll offset)
  set showcmd                     "mostra quina comanda estas escribint a baix a la dreta
  set tags=tags                   "ctags(1) file
  set wildmenu                    "display all matching files in tab complete

"MAPS:
  "resyntax current file (ara ho faig amb ,s)
  nnoremap <f10> :syntax sync fromstart<CR>
  "obrir tag (ctags) o link a help (~"go to definition" visual studio style)
  nnoremap <f12> <C-]>
  "back from a jump
  nnoremap <f11> <C-T>
  "escape rapid a normal mode
  inoremap kj <Esc>
  inoremap KJ <Esc>
  "moure's per finestres amb <espai>
  nnoremap <space> <C-w>w
  "paste amb autoindent
  nnoremap p ]p
  "moure's sense tenir en compte el line wrapping
  nnoremap j gj
  nnoremap k gk
  "turn off arrow keys
  "noremap <up>    <nop>
  "noremap <down>  <nop>
  "noremap <left>  <nop>
  "noremap <right> <nop>
  "BUSCAR I CENTRAR: problema: els warnings de 'eof reached' no apareixen
  "nnoremap N Nzz
  "nnoremap n nzz
  "nnoremap * *zz
  "nnoremap # #zz
  "EVITAR ERRORS SORTINT I GUARDANT: "desactivat perquè anula poder escriure Q majúscula mentre busques
  "cmap Wq wq
  "cmap WQ wq
  "cmap Q q

"GENERAL:
  syntax on
  filetype plugin on                    "activar omni-completion (^x ^o)
  au FileType * set formatoptions-=cro  "desactivar auto comments
  au bufwritepost vimrc source $MYVIMRC "auto reload vimrc quan guardes
  match ErrorMsg '\s\+$'                "troba trailing whitespaces
  "underline urls, extret de https://gist.github.com/tobym/584909
  highlight Url_underline term=underline cterm=underline ctermbg=black
  match     Url_underline 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*'
  "remember last position opening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  let g:netrw_banner=0    "netrw disable annoying banner
  let g:netrw_liststyle=3 "netrw tree view

"CUSTOM SYNTAX:
  "crontabs
  autocmd filetype crontab setlocal nobackup nowritebackup
