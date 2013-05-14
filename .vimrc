" Pathogen init
execute pathogen#infect()

" Schemat kolorów
:colorscheme torte

" Wczytuj odpowiednie wtyczki zważywszy na typ pliku
filetype plugin indent on
filetype plugin on

" Automatyczne wcięcia
set autoindent

" Używanie myszy
" set mouse=a

" Kopiowanie do systemowego schowka
set clipboard=unnamedplus

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

" When pattern cconstains any of A-Z; case matters
set smartcase

"" matching {{{
set showmatch "" Show matching.
set matchpairs+=<:> "" Match <,> too.
set matchtime=4 "" Decrease matching time.
"" }}}

" Omnicomplete zmiana skrótu klawiszowego z Ctrl+x Ctrl+o na Ctrl+space
inoremap <Nul> <C-x><C-o>

"" completion {{{
set complete=.,w,b,i,d,] "" Specify complete sources.
set completeopt=menu,preview "" Specify completion look.

set showfulltag "" Show tag-name and search pattern.
set taglength=0 "" Complete all tags.
"" }}}

" Omnicomplete zmiana tła i czcionki
:hi Pmenu ctermfg=white ctermbg=darkgrey guibg=#ffffff
:hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

" Make dla Pythona
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

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

" Wcięcia w stylu GNU
function! GnuIndent()
    setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
    setlocal shiftwidth=2
    setlocal tabstop=8
endfunction

au FileType c,cpp call GnuIndent()

" TEXmode
function! TEXmode()
  setlocal linebreak
  setlocal wrap
endfunction

au FileType tex call TEXmode()

" Powracanie do ostatnio edytowanego miejsca w pliku przy otwarciu
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Usuń spacje na końcu linii przy zapisie
autocmd BufWritePre * :%s/\s\+$//e

" Dopełnianie nawiasów etc
imap { {}<LEFT>
imap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
