if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
endif
autocmd BufEnter * silent! if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * silent! lcd %:p:h
autocmd FileType help nnoremap <buffer> q <C-w>c
augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neoinclude.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'cohama/lexima.vim'
Plug 'scrooloose/nerdcommenter'
call plug#end()

source ~/Documents/Programming/Library/fujii/vim/commands.vim

let mapleader=";"
let g:NERDDefaultAlign='left'
let g:neoinclude#paths = {'cpp': '/usr/local/Cellar/boost/1.68.0/include'}
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'c': ['clangd'],
  \ 'cpp': ['clangd']
\ }
let g:LanguageClient_diagnosticsDisplay = {
  \ 1: {
  \ "name": "Error",
  \ "texthl": "ALEError",
  \ "signText": "✘",
  \ "signTexthl": "ALEErrorSign",
  \ },
  \ 2: {
  \ "name": "Warning",
  \ "texthl": "ALEWarning",
  \ "signText": "◆",
  \ "signTexthl": "ALEWarningSign",
  \ },
  \ 3: {
  \ "name": "Information",
  \ "texthl": "ALEInfo",
  \ "signText": "ℹ",
  \ "signTexthl": "ALEInfoSign",
  \ },
  \ 4: {
  \ "name": "Hint",
  \ "texthl": "ALEInfo",
  \ "signText": "・",
  \ "signTexthl": "ALEInfoSign",
  \ },
\ }

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

nnoremap <C-]> :call LanguageClient_textDocument_formatting()<CR>
nnoremap ; :
nnoremap : ;
nnoremap tp <Plug>AirlineSelectPrevTab
nnoremap tn <Plug>AirlineSelectNextTab
nnoremap <silent> <Esc><Esc> :noh<CR>
nnoremap <silent> td :bd<CR>
nnoremap  <C-o> :NERDTreeToggle<cr>
nnoremap <silent> wh <C-w>h
nnoremap <silent> wl <C-w>l
nnoremap  cn :call LanguageClient#textDocument_rename()<CR>
nnoremap <A-p> :pu<CR>
nnoremap j gj
nnoremap k gk
nnoremap gd :call LanguageClient_textDocument_definition()<CR>
vnoremap c <nop>
inoremap <silent> jj <ESC>
"Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_or_jump)
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

set hidden
set ignorecase
set smartcase
set clipboard=unnamed
set wrapscan
set number
set autoindent
set tabstop=4
set shiftwidth=2
set smartindent
set title
set list
set whichwrap=h,l,<,>,[,],b
set virtualedit=block,onemore
set backspace=indent,eol,start
set expandtab
set wildmenu
set wildmode=longest,full
set listchars=tab:→-,trail:-,extends:»,precedes:«,nbsp:@
set cursorline
set cursorcolumn
set visualbell t_vb=
set noerrorbells
set backup
set undofile
set swapfile
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//
set directory=~/.vim/swp//
set incsearch
set autoread
set scrolloff=5
set ambiwidth=single

syntax on

highlight MatchParen ctermfg=white ctermbg=brown
highlight SpellBad ctermfg=red cterm=underline ctermbg=none
highlight SpecialKey ctermfg=darkgray
highlight NonText ctermfg=darkgray
highlight CursorLine cterm=none ctermfg=none ctermbg=black
highlight CursorColumn cterm=none ctermfg=none ctermbg=black
highlight Cursor cterm=none ctermfg=white ctermbg=green
highlight CursorLineNr cterm=none ctermfg=green ctermbg=none
highlight LineNr ctermfg=darkgray ctermbg=none
highlight Search cterm=none ctermfg=black ctermbg=yellow
highlight EndOfBuffer ctermbg=none ctermfg=darkgray
highlight SignColumn ctermbg=none
highlight ALEErrorSign ctermfg=darkred
highlight ALEWarningSign ctermfg=yellow
highlight ALEInfoSign ctermfg=blue
highlight Pmenu ctermbg=darkgray ctermfg=white
highlight PmenuSel ctermbg=green

