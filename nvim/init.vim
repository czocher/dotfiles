" For YouCompleteMe installation
let g:plug_timeout=120

" Set plugins, :PlugInstall to install

call plug#begin('~/.config/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-sensible'

Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

Plug 'townk/vim-autoclose'

Plug 'tomtom/tcomment_vim'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'geoffharcourt/vim-matchit'

Plug 'jamessan/vim-gnupg'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --racer-completer' }

Plug 'tpope/vim-fugitive'

Plug 'editorconfig/editorconfig-vim'

Plug 'tweekmonster/startuptime.vim'

Plug 'wincent/terminus'

" Language plugins

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }

Plug 'python-mode/python-mode', { 'branch': 'develop' }

Plug 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX', { 'for': 'plaintex' }

Plug 'leafgarland/typescript-vim'

Plug 'posva/vim-vue'

Plug 'fatih/vim-go'

Plug 'rust-lang/rust.vim'

Plug 'othree/html5.vim'

Plug 'plasticboy/vim-markdown'

call plug#end()

" Language Server Client options
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Required for operations modifying multiple buffers like rename.
set hidden

" Enable powerline symbols for airline, requires font setup
let g:airline_powerline_fonts = 1

" Set the airline theme
let g:airline_theme='solarized'

" Faster editorconfig loading
let g:EditorConfig_core_mode = 'python_external'

" Disable global markdown folding
let g:vim_markdown_folding_disabled = 1

" Set the rust source directory
let g:ycm_rust_src_path=$RUST_SRC_PATH

" Disable the tab key for YouCompleteMe so Ultisnips works
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

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

" Highlight the cursor column
set cursorcolumn

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

" Disable folding
set nofoldenable

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

" Move lines up and down with <S-Up> and <S-Down>
inoremap <S-Up> <Esc>:m -2<CR>i
inoremap <S-Down> <Esc>:m +1<CR>i
nnoremap <S-Up> :m -2<CR>
nnoremap <S-Down> :m +1<CR>


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

" GPG settings
let g:GPGUseAgent=1
let g:GPGPreferSymmetric=0
let g:GPGPreferArmor=1
let g:GPGUsePipes=1
let g:GPGExecutable="gpg2 --trust-model always"
