syntax on

autocmd BufNewFile,BufRead *.c setfiletype c
autocmd BufNewFile,BufRead *.cpp setfiletype cpp
autocmd BufNewFile,BufRead *.cxx setfiletype cpp
autocmd BufNewFile,BufRead *.cc setfiletype cpp
autocmd BufNewFile,BufRead *.hpp setfiletype cpp
autocmd BufNewFile,BufRead *.hh setfiletype cpp
autocmd BufNewFile,BufRead *.vim setfiletype vim

"前回編集した行まで移動
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
endif
autocmd BufEnter * silent! if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * silent! lcd %:p:h
"Helpをqで閉じる
autocmd FileType help nnoremap <buffer> q <C-w>c

call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'Shougo/deoplete.nvim'
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

let g:airline_theme='wombat'
let g:NERDDefaultAlign='left'
let g:neoinclude#paths = {
  \'cpp': '/usr/local/Cellar/boost/1.68.0/include,/usr/local/Cellar/gsl/2.5/include,/Applications/root_v6.14.06/include_compiler',
\}
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'c': ['clangd'],
  \ 'cpp': ['clangd'],
  \ 'python': ['/usr/local/bin/pyls'],
\}
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

let mapleader = "\<Space>"

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

nnoremap ; :
nnoremap : ;
nnoremap <C-]> :call LanguageClient_textDocument_formatting()<CR>
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Esc><Esc> :noh<CR>
nnoremap <Leader>t :NERDTreeToggle<cr>
nnoremap <Leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <A-p> :pu<CR>
nnoremap j gj
nnoremap k gk
nnoremap <Leader>gd :call LanguageClient_textDocument_definition()<CR>
vnoremap c <nop>
inoremap <silent> jj <ESC>
inoremap <C-l> <C-g>U<Right>
inoremap <C-h> <C-g>U<Left>
"Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_or_jump)
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

set signcolumn=yes
set shortmess+=I
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

highlight MatchParen ctermfg=white ctermbg=brown
highlight SpellBad ctermfg=red cterm=underline ctermbg=none
highlight SpecialKey ctermfg=darkgray
highlight NonText ctermfg=darkgray
highlight CursorLine cterm=none ctermfg=none ctermbg=none
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
