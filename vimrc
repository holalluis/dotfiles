"VIMRC holalluis
"bash alias vimrc='vim ~/vimrc/vimrc'

"ZONA DE PROVES:
  command! Groff :w | !bash compile.sh| "fes servir l'script compile.sh per compilar .ms a .pdf
  nnoremap ,g :Groff<CR>|               "see above
  set display=lastline "comment per fer
  set smarttab         "comment per fer
  set ttyfast          "comment per fer
  set autoread         "auto reload file if it has been changed outside vim
  set belloff=all      "never ring bell
  set history=10000    "history of ':' commands, and history of previous search patterns

"NEW COMMANDS: start with capital letter
  command! Vimrc  :vsplit ~/vimrc/vimrc        "edit vimrc
  command! Apunts :vsplit ~/Dropbox/org/apunts "obre apunts folder
  command! Node   :w | :terminal node   %       "exec current file in node
  command! Python :w | :terminal python %       "exec current file in python
  command! Bash   :w | :terminal bash   %       "exec current file in bash

"LEADER KEY MAPS: leader is comma. el símbol '|' és per poder posar inline comments
  nnoremap ,a :e#<CR>|                    "edit alternate buffer
  nnoremap ,s :syntax sync fromstart<CR>| "resyntax current file
  nnoremap ,t :vertical terminal<CR>|     "open terminal
  nnoremap ,e :vs.<CR>|                   "vertical file explorer
  nnoremap ,n :Node<CR>|                  "exeucte current file in node

"SETS: activar i desactivar
  "nmap ,n :tabnext<cr>           "es pot fer amb gt
  "nmap ,p :tabprev<cr>           "es pot fer amb gT
  "set textwidth=80               "set text width
  "set colorcolumn=1              "set color column
  "set autochdir                  "canviar pwd automaticament
  "set foldmethod=manual          "manera de plegar text
  "set nofoldenable               "inicialment folds oberts
  "DESACTIVATS: mirar primer abans d'incloure nova opció que potser ja he mirat abans
  set nolist                      "see invisible characters
  set noruler                     "show position always (no m'agrada)
  set nocompatible                "more useful vim
  set nocursorcolumn              "ilumina columna on hi ha el cursor
  set nocursorline                "ilumina linia   on hi ha el cursor
  set nohidden                    "navega per arxius sense haver de guardar canvis (no m'agrada)
  set nohlsearch                  "hl search
  set noincsearch                 "incremental search
  set norelativenumber            "no relative number for line number
  set nowrap                      "les linies que surten de la pantalla no es veuen
  set autoindent                  "auto indent after enter
  set backspace=indent,start,eol  "backspace normal
  set clipboard=unnamed           "system clipboard
  set laststatus=1                "veure titol finestra (2=sempre, 1=només si n'hi ha més d'una oberta)
  set listchars=eol:$             "makes 'set list' look prettier
  set modelines=5                 "modeline/modelines (:help modeline)
  set mouse=a                     "mouse support
  set nrformats=bin,hex           "C-a suma decimals i hexadecimals correctament "test: 0b0101111 61 0x51
  set number                      "show line number
  set path+=**                    "(** searches subdirectories (fa anar gf una mica lent si la carpeta es gran))
  set scrolloff=0                 "minimal number of screen lines to keep above and below the cursor (scroll offset)
  set showcmd                     "mostra quina comanda estas escribint a baix a la dreta
  set tags=tags                   "ctags(1) file
  set wildmenu                    "display all matching files in tab complete
  "TABS:
  set expandtab                   "insert spaces instead of tab
  set foldignore=                 "ignora caràcter '#' per folding, plega'l correctament (útil per CSS)
  set shiftround                  "use multiple of shiftwidth when indenting with '<' and '>'
  set shiftwidth=2                "number of space character to use for indent
  set tabstop=2                   "width of tab character
  "FOLDS:
  set foldcolumn=0                "valors: 0 a 12, informacio lateral sobre folds
  set foldlevel=10                "inicialment folds oberts
  set foldmethod=indent           "manera de plegar text

"MAPS:
  nnoremap <f10> :syntax sync fromstart<CR>| "resyntax current file (ara ho faig amb ,s)
  nnoremap <f12> <C-]>|                      "obrir tag (ctags) o link a help (~"go to definition" visual studio style)
  nnoremap <f11> <C-T>|                      "back from a jump
  inoremap kj <Esc>|                         "escape rapid a normal mode
  inoremap KJ <Esc>|                         "escape rapid a normal mode
  nnoremap <space> <C-w>w|                   "moure's per finestres amb <espai>
  nnoremap p ]p|                             "paste amb autoindent
  nnoremap j gj|                             "moure sense tenir en compte line wrapping
  nnoremap k gk|                             "moure sense tenir en compte line wrapping
  "TURN OFF ARROW KEYS: problema: pair programming
  "noremap <up>    <nop>
  "noremap <down>  <nop>
  "noremap <left>  <nop>
  "noremap <right> <nop>
  "BUSCAR I CENTRAR: problema: els warnings de 'eof reached' no apareixen
  "nnoremap N Nzz
  "nnoremap n nzz
  "nnoremap * *zz
  "nnoremap # #zz
  "EVITAR ERRORS SORTINT I GUARDANT: problema: anula poder escriure Q majúscula mentre busques
  "cmap Wq wq
  "cmap WQ wq
  "cmap Q q

"GENERAL:
  syntax on                             "turn on syntax hl
  filetype plugin on                    "activar omni-completion (^x ^o)
  au FileType * set formatoptions-=cro  "desactivar auto comments
  "au bufwritepost vimrc source $MYVIMRC "auto reload vimrc quan guardes (fa coses rares)
  match ErrorMsg '\s\+$'                "troba trailing whitespaces
  "underline urls: extracted from https://gist.github.com/tobym/584909
  highlight Url_underline term=underline cterm=underline ctermbg=black
  match     Url_underline 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*'
  "remember last position opening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  let g:netrw_banner=0    "netrw disable annoying banner
  let g:netrw_liststyle=3 "netrw tree view

"SYNTAX RELATED:
  autocmd filetype crontab setlocal nobackup nowritebackup      "crontab files
  autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set ft=groff "groff files
