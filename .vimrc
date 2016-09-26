" Pathogen init
execute pathogen#infect()

" Schemat kolorów
"let g:solarized_termcolors=256
"colorscheme solarized
"set background=dark

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-d>"
let g:UltiSnipsJumpBackwardTrigger="<C-a>"
let g:UltiSnipsUsePythonVersion = 2

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

" Wczytuj odpowiednie wtyczki zważywszy na typ pliku
filetype plugin indent on
filetype plugin on

" Automatyczne wcięcia
set autoindent

" Używanie myszy
" set mouse=a

" Kopiowanie do systemowego schowka
set clipboard=unnamedplus

" Persistent undo
set undofile                " Save undo's after file closes
set undodir=~/.vim/undo     " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Zaznacz 80 kolumnę
set colorcolumn=80

" Regulacja wcięć: zamieniaj tabulatory na spacje, ustaw taby na 2 spacje i spraw by vim traktował każde 4 spacje jako jeden tabulator dzięki czemu nie trzeba wciskać czterokrotnie backspace
set et ts=2 sw=2 softtabstop=2

autocmd FileType html set et ts=2 sw=2 softtabstop=2 nocindent
autocmd FileType python set et ts=4 sw=4 softtabstop=4

" Podświetlaj znaki powyżej 80-tej kolumny
autocmd FileType python match ErrorMsg '\%>80v.\+'

" Podświetlaj składnię
syntax enable

" Pokazuj linijkę zawierającą numer wiersza, kolumnę i procentowe położenie kursora w pliku
set ruler

" Pokazuj aktualny tryb pracy
set showmode

" Pokaż polecenia w prawym dolnym rogu ekranu
set showcmd

" Pokazuj numery wierszy
set number

" Podświetlaj aktualny wiersz
set cul

" Nie zawijaj wierszy
set nowrap

" Podświetlenie przy szukaniu
set hlsearch

" Incremental search
set incsearch

" When pattern ccontains only a-z; case does not matter
set ignorecase

" When pattern constains any of A-Z; case matters
set smartcase

"" matching
set showmatch "" Show matching.
set matchpairs+=<:> "" Match <,> too.
set matchtime=4 "" Decrease matching time.

" Disable gVim gui elements
if has("gui_running")
  set antialias "" Enable antialiasing.
  set guifont=Inconsolata\ 10 "" Specify colorscheme.
  set guioptions+=c "" Use console dialogs.
  set guioptions-=e "" Disable GUI-tab-pages.
  set guioptions+=i "" Use a Vim icon.
  set guioptions-=m "" Disable main menu.
  set guioptions+=g "" Make item grey if not active.
  set guioptions-=T "" Disable toolbar.
  set guioptions-=r "" Disable right-hand scrollbar.
  set guioptions-=R "" Same as above.
  set guioptions-=l "" Disable left-hand scrollbar.
  set guioptions-=L "" Same as above.
  set guioptions-=b "" Disable bottom scrollbar.
  set guioptions-=v "" Use a vertical button layout.

  set guipty "" Use pseudo-tty for I/O.
endif

" Omnicomplete zmiana skrótu klawiszowego z Ctrl+x Ctrl+o na Ctrl+space
inoremap <Nul> <C-x><C-o>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"" completion
set complete=.,w,b,i,d,] "" Specify complete sources.
set completeopt=longest,menuone

set completeopt=menu,preview "" Specify completion look.

set showfulltag "" Show tag-name and search pattern.
set taglength=0 "" Complete all tags.

" Omnicomplete zmiana tła i czcionki
:hi Pmenu ctermfg=white ctermbg=darkgrey guibg=#ffffff
:hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

" Enable Omnicomplete
set omnifunc=syntaxcomplete#Complete

" Sprawdzanie pisowni po wciśnięciu F7
set spelllang=pl,en
map   <silent><F7>            :setlocal spell!<CR>
imap  <silent><F7>            <ESC>:setlocal spell!<CR>i<right>

" Wyłączanie podświetlania po wciśnięciu CTRL+N
nmap <silent> <C-N> :silent noh<CR>

" Wielokrotne wcięcia przy pomocy '<' i '>'
vnoremap < <gv
vnoremap > >gv

" Nie pozwalaj na żadne modyfikacje plików tylko do odczytu.
au BufReadPost * :call CheckReadonly()
function! CheckReadonly()
    if version >= 600
        if &readonly
            setlocal nomodifiable
        endif
    endif
endfunction

" Zaczynaj nowy plik w trybie Insert
autocmd BufNewFile * startinsert

" TEXmode
function! TEXmode()
  setlocal linebreak
  setlocal wrap
endfunction

au FileType plaintex call TEXmode()

" Powracanie do ostatnio edytowanego miejsca w pliku przy otwarciu
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Usuń spacje na końcu linii przy zapisie
autocmd BufWritePre * :%s/\s\+$//e

imap <M-Space> <Space>

" Blowfish2 jako algorytm szyfrowania plików
set cm=blowfish2
