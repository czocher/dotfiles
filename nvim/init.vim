" Set plugins, :PlugInstall to install

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-scripts/tlib'

Plug 'vim-scripts/AutoComplPop'

Plug 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'

Plug 'klen/python-mode'

Plug 'tomtom/tcomment_vim'

Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'leafgarland/typescript-vim'

Plug 'rust-lang/rust.vim'

Plug 'vim-scripts/pythoncomplete'

Plug 'honza/vim-snippets'

Plug 'SirVer/ultisnips'

Plug 'vim-airline/vim-airline'

Plug 'klen/python-mode'

Plug 'geoffharcourt/vim-matchit'

Plug 'othree/html5.vim'

Plug 'altercation/vim-colors-solarized'

Plug 'townk/vim-autoclose'

call plug#end()

" Solarized colorscheme
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-d>"
let g:UltiSnipsJumpBackwardTrigger="<C-a>"
let g:UltiSnipsUsePythonVersion = 3

" Load file dependent plugins
filetype plugin on

" Persistent undo
set undofile                    " Save undo's after file closes
set undodir=~/.config/nvim/undo " Where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " Number of lines to save for undo

" Highlight the 80th column
set colorcolumn=80

" Change tabs to spaces, set tab to two spaces
set et ts=2 sw=2 softtabstop=2

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

" Show matching
set showmatch

" Match < and > too
set matchpairs+=<:>

" Decrease maching time
set matchtime=4

" Omnicomplete keybinding change from Ctrl+x Ctrl+o to Ctrl+space
inoremap <Nul> <C-x><C-o>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Specify the completion sources
set complete=.,w,b,i,d,]
set completeopt=longest,menuone

" Specify the completion look
set completeopt=menu,preview

" Show tag-name and search pattern
set showfulltag

" Complete all tags
set taglength=0

" Change the Omnicomplete background and font
:hi Pmenu ctermfg=white ctermbg=darkgrey guibg=#ffffff
:hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

" Enable Omnicomplete
set omnifunc=syntaxcomplete#Complete

" Spellcheck when F7 pressed
set spelllang=pl,en
map <silent><F7> :setlocal spell!<CR>
imap <silent><F7> <ESC>:setlocal spell!<CR>i<right>

" Multi indent with > and <
vnoremap < <gv
vnoremap > >gv

" If file is read only disallow editing
au BufReadPost * :call CheckReadonly()
function! CheckReadonly()
    if version >= 600
        if &readonly
            setlocal nomodifiable
        endif
    endif
endfunction

" Open file in Insert mode
autocmd BufNewFile * startinsert

" Return to the last edited file position
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Different filetype-based configs

" HTML configs
autocmd FileType html set et ts=2 sw=2 softtabstop=2 nocindent

" Python configs
autocmd FileType python set et ts=4 sw=4 softtabstop=4

" Highlight everything above the 80th column
autocmd FileType python match ErrorMsg '\%>80v.\+'

" X clipboard support
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

" TEX configs

" Break and wrap lines when editing TEX files
function! TEXmode()
  setlocal linebreak
  setlocal wrap
endfunction
au FileType plaintex call TEXmode()
