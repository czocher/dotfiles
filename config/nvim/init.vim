" ~/.config/nvim/init.vim

scriptencoding utf-8

" -----------------------------------------------------------------------------
" General
" -----------------------------------------------------------------------------

let mapleader = ' '
let maplocalleader = ','

set shell=/bin/zsh
set hidden
set confirm
set clipboard=unnamedplus

filetype plugin indent on
syntax enable

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

let g:plug_timeout = 120

call plug#begin('~/.config/nvim/plugged')

" Navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" Editing
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Git and encrypted files
Plug 'tpope/vim-fugitive'
Plug 'jamessan/vim-gnupg'

" Language support
Plug 'lervag/vimtex'
Plug 'neovim/nvim-lspconfig'

" Appearance
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Markdown
Plug 'plasticboy/vim-markdown'

call plug#end()

" -----------------------------------------------------------------------------
" Appearance
" -----------------------------------------------------------------------------

set termguicolors
set background=dark
let g:solarized_termcolors = 256
silent! colorscheme solarized

set number
set cursorline
set cursorcolumn
set nowrap
set colorcolumn=80
set signcolumn=yes
set laststatus=3

let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'

" -----------------------------------------------------------------------------
" Editing behaviour
" -----------------------------------------------------------------------------

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set matchpairs+=<:>
set matchtime=2

set nofoldenable
set splitbelow
set splitright
set scrolloff=5
set sidescrolloff=5

set updatetime=250
set timeoutlen=300

" Native popup / omnifunction completion.
set completeopt=menuone,noselect,popup
set pumheight=12

" -----------------------------------------------------------------------------
" Persistent undo
" -----------------------------------------------------------------------------

let s:undo_dir = stdpath('state') . '/undo'

if !isdirectory(s:undo_dir)
call mkdir(s:undo_dir, 'p', 0700)
endif

let &undodir = s:undo_dir

set undofile
set undolevels=1000
set undoreload=10000

" -----------------------------------------------------------------------------
" Plugin configuration
" -----------------------------------------------------------------------------

" UltiSnips
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<C-d>'
let g:UltiSnipsJumpBackwardTrigger = '<C-a>'
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsEditSplit = 'vertical'

" NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-gnupg
let g:GPGUseAgent = 1
let g:GPGPreferSymmetric = 0
let g:GPGPreferArmor = 1
let g:GPGUsePipes = 1
let g:GPGExecutable = 'gpg'

" -----------------------------------------------------------------------------
" Key mappings
" -----------------------------------------------------------------------------

" Navigation
nnoremap <silent> <C-p> :CtrlP<CR>
nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>N :NERDTreeFind<CR>

" Spell checking
set spelllang=pl,en
nnoremap <silent> <F7> :setlocal spell!<CR>
inoremap <silent> <F7> <C-o>:setlocal spell!<CR>

" Ctrl-Space commonly arrives as NUL in terminal Neovim.
" LSP automatically sets omnifunc for attached buffers.
inoremap <silent><expr> <Nul> pumvisible()
\ ? "<C-n>"
\ : "<C-x><C-o>"

" Keep visual selection after indentation.
xnoremap < <gv
xnoremap > >gv

" Move lines with Shift-Up / Shift-Down.
nnoremap <S-Up> :move -2<CR>==
nnoremap <S-Down> :move +1<CR>==

inoremap <S-Up> <Esc>:move -2<CR>==gi
inoremap <S-Down> <Esc>:move +1<CR>==gi

xnoremap <S-Up> :move '<-2<CR>gv=gv
xnoremap <S-Down> :move '>+1<CR>gv=gv

" -----------------------------------------------------------------------------
" Native LSP mappings
" -----------------------------------------------------------------------------

nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>

nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
xnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>

nnoremap <silent> <leader>e <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> [d <cmd>lua vim.diagnostic.jump({ count = -1, float = true })<CR>
nnoremap <silent> ]d <cmd>lua vim.diagnostic.jump({ count = 1, float = true })<CR>

command! -bar Format lua vim.lsp.buf.format({ async = true })

" -----------------------------------------------------------------------------
" Commands and autocmds
" -----------------------------------------------------------------------------

function! TrimWhitespace() abort
let l:view = winsaveview()
silent! keeppatterns %s/\s+$//e
call winrestview(l:view)
endfunction

command! TrimWhitespace call TrimWhitespace()

augroup user_config
autocmd!

" Restore the last cursor position.
autocmd BufReadPost *
\ if line("'"") > 1 && line("'"") <= line("$") |
\   normal! g`" |
\ endif

" Preserve your preference for editing new files immediately.
autocmd BufNewFile * startinsert

" Language-specific indentation.
autocmd FileType python
\ setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

autocmd FileType html,css,javascript,typescript,json,yaml
\ setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd FileType make setlocal noexpandtab

" Writing formats.
autocmd FileType markdown setlocal textwidth=80
autocmd FileType plaintex,tex setlocal linebreak wrap
augroup END

" -----------------------------------------------------------------------------
" Native LSP server activation
"
" Install the external server programs separately. Missing servers are harmless:
" Neovim simply will not attach them to a matching buffer.
" -----------------------------------------------------------------------------

if isdirectory(expand('~/.config/nvim/plugged/nvim-lspconfig'))
silent! lsp enable ansiblels
silent! lsp enable bashls
silent! lsp enable clangd
silent! lsp enable gopls
silent! lsp enable jsonls
silent! lsp enable lua_ls
silent! lsp enable pyright
silent! lsp enable rust_analyzer
silent! lsp enable ts_ls
silent! lsp enable yamlls
endif

