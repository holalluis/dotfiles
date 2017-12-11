"VIMRC VIM 8.0 - MACBOOK AIR 10.11.6
"alias vimrc='vim ~/vimrc/vimrc'

"DESCARTATS:
"set autochdir           "canviar pwd automaticament
"set foldcolumn=1        "valors: 0 a 12, informacio lateral sobre folds
"set foldmethod=manual   "manera de plegar text
"set nofoldenable        "inicialment folds oberts
"let g:netrw_browse_split=4  " open in prior window
"let g:netrw_altv=1          " open splits to the right
"set ruler                   "show position always (no m'agrada)
"set hidden                  "navega per finestres sense haver de guardar canvis (no m'agrada)
"set cursorline

"PROVANT:
"PLUGINS:
execute pathogen#infect()

"plugin vimorganizer
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org filetype plugin indent on
au BufEnter *.org call org#SetOrgFileType()
au BufEnter *.org hi Folded ctermbg=0 ctermfg=3
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()

"plugin vimwiki (per taules en format text)
filetype plugin on

"CONFIRMATS: (des d'aquí fins al final)
set relativenumber
set laststatus=1 "veure titol finestra si n'hi ha més d'una oberta
set nocompatible
syntax on

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
let g:netrw_banner=0        " disable annoying banner
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"MISC:
"següent pestanya
nmap , :tabnext<cr>
"reset syntax colors
nmap <f10> :syntax sync fromstart<CR>
"obrir tag (ctags) o link a help (~"go to definition" visual studio style)
nmap <f12> <C-]>
"back from a jump
nmap <f11> <C-T>
"alternate register for Mac OS X
nmap <C-E> :e#<CR>
"escape rapid a normal mode
inoremap kj <Esc>
"moure's per finestres amb <espai>
nmap <space> <C-w>w
"paste amb indent
map p ]p
set nrformats=hex           "ctrl-a suma numeros decimals
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
