"VIMRC VIM 8.0 - MACBOOK AIR 10.11.6
"bash tip: alias vimrc='vim ~/vimrc/vimrc'

"PER PROVAR:
"hex editing
"prova per fer Gcommit

"PROVANT:
set laststatus=1

"PLUGINS:
set runtimepath^=~/.vim/bundle/vim-fugitive
"set runtimepath^=~/.vim/bundle/vim-sql-workbench

"DESCARTATS:
"set autochdir           "canviar pwd automaticament
"set foldcolumn=1        "valors: 0 a 12, informacio lateral sobre folds
"set foldmethod=manual   "manera de plegar text
"set nofoldenable        "inicialment folds oberts
"let g:netrw_browse_split=4  " open in prior window
"let g:netrw_altv=1          " open splits to the right
"set ruler                   "show position always (no m'agrada)
"set hidden                  "navega per finestres sense haver de guardar canvis (no m'agrada)

"CONFIRMATS: (des d'aquí fins al final)

"enter the current millenium (github/mcantor)
set nocompatible

"COLORS:
syntax on
colorscheme default

"INDENTING AND FOLDING:
set autoindent
set tabstop=2           "width of tab character
set shiftwidth=2        "number of space character to use for indent
set softtabstop=2       "?
set shiftround          "use multiple of shiftwidth when indenting with '<' and '>'
set foldmethod=indent   "manera de plegar text
set foldlevel=10        "inicialment folds oberts

"IGNORA:
"ignora caràcter '#' per folding, plega'l correctament
set foldignore=

"FINDING FILES:
"(** searches subdirectories)
set path+=**
"display all matching files in tab complete
set wildmenu

"FILE BROWSING:
let g:netrw_banner=0        " disable annoying banner
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"MISC:
"següent pestanya
nmap , :tabnext<cr>
"reset syntax colors
nmap <f10> :syntax sync fromstart<CR>
"obrir tag (ctags) o link a help (visual studio style)
nmap <f12> <C-]>
"enrere
nmap <f11> <C-T>
"alternate register for Mac OS X
nmap <C-E> :e#<CR>
"escape rapid a normal mode
inoremap kj <Esc>
"moure's per finestres amb <espai>
nmap <space> <C-w>w
"paste amb indent
map p ]p
set nrformats=bin,hex           "ctrl-a suma numeros decimals
set clipboard=unnamed           "system clipboard
set history=100
set nowrap                      "les linies que surten de la pantalla no es veuen
set number                      "line number
set showcmd                     "mostra quina comanda estas escribint a baix a la dreta
set tags=tags                   "ctags (veure man ctags)
set backspace=indent,start,eol  "proper backspace

"remember last position opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"BUSCAR I CENTRAR:
nnoremap N Nzz
nnoremap n nzz
nnoremap * *zz
nnoremap # #zz

"moure's sense tenir en compte el line wrapping
nnoremap j gj
nnoremap k gk

"EVITAR ERRORS:
cmap Wq wq
cmap WQ wq
cmap Q q

"modeline/modelines
set modelines=5
