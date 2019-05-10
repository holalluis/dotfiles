"VIMRC holalluis
"alias vimrc='vim ~/vimrc/vimrc'

"ZONA DE PROVES:
  nnoremap ,m :make -k -j4<cr><cr>
  set hlsearch         "highlight while searching
  set display=lastline "comment per fer
  set smarttab         "comment per fer
  set ttyfast          "comment per fer
  set autoread         "auto reload file if it has been changed outside vim
  set belloff=all      "never ring bell
  set history=10000    "history of ':' commands, and history of previous search patterns
  set textwidth=0      "set text width

"ZONA PERMANENT:
  "fzf: fuzzy file finder
  set rtp+=/usr/local/opt/fzf
  nnoremap ,f :FZF<CR>

  "underline urls: extracted from https://gist.github.com/tobym/584909
  highlight Url_underline term=underline cterm=underline ctermbg=black
  match Url_underline 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*'

"LEADER KEY MAPS:
  nnoremap ,, :e#<CR>|                    "edit alternate buffer
  nnoremap ,b :ls<cr>:b|                  "open buffer explorer
  nnoremap ,n :Node<cr>|                  "execute current file in nodejs
  nnoremap ,r :source ~/vimrc/vimrc<cr>|  "reload vimrc
  nnoremap ,s :syntax sync fromstart<CR>| "resyntax current file
  nnoremap ,t :vertical terminal<CR>|     "open terminal

"CUSTOM :COMMANDS start with capital letter
  command! Vimrc          :vs ~/vimrc/vimrc           "edit vimrc
  command! Org            :vs ~/Dropbox/org/lluis.md  "open org file
  command! TrimWhitespace keeppatterns %s/\s\+$//e

  "exec current file in various interpreters
  command! Node   :w | :terminal node %
  command! Bash   :w | :terminal bash %
  command! Python :w | :terminal python3 %

"GENERAL:
  syntax on                             "turn on syntax hl
  au FileType * set formatoptions-=cro  "desactivar auto comments
  match ErrorMsg '\s\+$'                "ressalta trailing whitespaces
  let g:netrw_banner=0                  "netrw disable annoying banner
  let g:netrw_liststyle=3               "netrw tree view

  "remember last position opening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"SETS: activar i desactivar
  "set colorcolumn=0              "set color column
  "set autochdir                  "canviar pwd automaticament
  "set foldmethod=manual          "manera de plegar text
  "set nofoldenable               "inicialment folds oberts
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
  set ttymouse=xterm2             "mouse support
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
  nnoremap Q gqq|                            "desactivar comandes ex
  nnoremap <f10> :syntax sync fromstart<CR>| "resyntax current file (,s equivalent)
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

"SYNTAX RELATED:
  autocmd filetype crontab setlocal nobackup nowritebackup      "crontab files
  autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set ft=groff "groff files
