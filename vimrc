"VIMRC holalluis
"useful bash alias: vimrc='vim ~/vimrc/vimrc'

"ZONA DE PROVES:
"vertical terminal
:command Vter :vertical terminal

"alternate buffer
nnoremap ,a :e#<CR>
"següent pestanya
nmap ,m :tabnext<cr>
nmap ,n :tabprev<cr>

"PROVATS I DESACTIVATS: (estan al principi per evitar reactivar-los)
"set textwidth=80            "set text width
"set colorcolumn=+1          "set color column
"nnoremap <C-e> :e#<CR>      "edit alternate buffer (CTRL-^)
"set autochdir               "canviar pwd automaticament
"set foldcolumn=1            "valors: 0 a 12, informacio lateral sobre folds
"set foldmethod=manual       "manera de plegar text
"set nofoldenable            "inicialment folds oberts
"set hidden                  "navega per finestres sense haver de guardar canvis (no m'agrada)
"let g:netrw_browse_split=4  " open in prior window
"let g:netrw_altv=1          " open splits to the right
set nocursorline              "ilumina linia del cursor
set nocursorcolumn            "ilumina columna del cursor
set nolist                   "see invisible characters
set noruler                  "show position always (no m'agrada)
set norelativenumber         "no relative number for line number
set nohlsearch
"autocmd bufwritepost vimrc source $MYVIMRC "auto reload vimrc (no funciona)
"--------------------------------------------------------------

"PROVATS CONFIRMATS: (des d'aquí fins al final)
"----------------------------------------------
syntax on
set nocompatible
set mouse=a
set laststatus=1 "veure titol finestra si n'hi ha més d'una oberta

"custom command to edit vimrc with ':Vimrc'
:command Vimrc vsplit ~/vimrc/vimrc

"SYNTAX:
"troba trailing whitespaces
match ErrorMsg '\s\+$'
"inspired by https://gist.github.com/tobym/584909
highlight Url_underline term=underline cterm=underline ctermbg=black
match     Url_underline 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*'

"COLORS:
"colorscheme default

"INDENTING AND FOLDING:
set autoindent
set foldmethod=indent   "manera de plegar text
set foldlevel=10        "inicialment folds oberts

"TABS:
set expandtab           "insert spaces instead of tab
set tabstop=2           "width of tab character
set shiftwidth=2        "number of space character to use for indent
set shiftround          "use multiple of shiftwidth when indenting with '<' and '>'

"IGNORA:
"ignora caràcter '#' per folding, plega'l correctament (útil per CSS)
set foldignore=

"FINDING FILES:
set path+=**    "(** searches subdirectories)
set wildmenu    "display all matching files in tab complete

"FILE BROWSING:
let g:netrw_banner=0    "disable annoying banner
let g:netrw_liststyle=3 "tree view

"MAPS:
"reset syntax colors
nmap <f10> :syntax sync fromstart<CR>
"obrir tag (ctags) o link a help (~"go to definition" visual studio style)
nmap <f12> <C-]>
"back from a jump
nmap <f11> <C-T>
"escape rapid a normal mode
inoremap kj <Esc>
inoremap KJ <Esc>
"moure's per finestres amb <espai>
nmap <space> <C-w>w
"paste amb autoindent
map p ]p
"moure's sense tenir en compte el line wrapping
nnoremap j gj
nnoremap k gk
"turn off arrow keys
noremap <up>    <nop>
noremap <down>  <nop>
noremap <left>  <nop>
noremap <right> <nop>

set nrformats=bin,hex           "C-a suma decimals i hexadecimals correctament
"prova: 0b1001101 61 0x51

set clipboard=unnamed           "system clipboard
set history=100
set nowrap                      "les linies que surten de la pantalla no es veuen
set number                      "line number
set showcmd                     "mostra quina comanda estas escribint a baix a la dreta
set tags=tags                   "ctags (veure man ctags)
set backspace=indent,start,eol  "proper backspace
set modelines=5                 "modeline/modelines (:help modeline)

"remember last position opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"BUSCAR I CENTRAR: problema: els warnings de 'eof reached' no apareixen
"nnoremap N Nzz
"nnoremap n nzz
"nnoremap * *zz
"nnoremap # #zz

"EVITAR ERRORS: "desactivat perquè anula poder escriure Q majúscula mentre busques
"cmap Wq wq
"cmap WQ wq
"cmap Q q

"per crontabs
autocmd filetype crontab setlocal nobackup nowritebackup
