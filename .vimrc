if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
endif
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
call plug#end()

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

augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

inoremap <silent> jj <ESC>
nnoremap <silent> <CR> i<CR><ESC>
nnoremap <silent> <Backspace> i<Backspace><right><Esc>
nnoremap <silent> <Space> i<Space><right><ESC>
nnoremap <C-f> :call LanguageClient_textDocument_formatting()<CR>
nnoremap ; :
nnoremap : ;
nmap <silent> tp <Plug>AirlineSelectPrevTab
nmap <silent> tn <Plug>AirlineSelectNextTab
nnoremap <silent> td :bd<CR>
nnoremap <silent> <C-q> :NERDTreeToggle<CR>
nnoremap <silent> wh <C-w>h
nnoremap <silent> wl <C-w>l

let g:airline_left_sep=''
let g:airline_right_sep=''
set spell
set number
set autoindent
set tabstop=2
set shiftwidth=2
set smartindent
set title
set list
set whichwrap=b,s,[,],<,>
set virtualedit=block
set backspace=indent,eol,start
set expandtab
set listchars=tab:→-,trail:-,extends:»,precedes:«,nbsp:@
set cursorline
set visualbell t_vb=
set noerrorbells
set incsearch
set autoread
set scrolloff=5
set ambiwidth=single

syntax on

highlight SpellBad ctermfg=red cterm=underline ctermbg=none
highlight SpecialKey ctermfg=darkgray
highlight NonText ctermfg=darkgray
highlight CursorLine cterm=none ctermfg=none ctermbg=none
highlight Cursor cterm=none ctermfg=none ctermbg=green
highlight CursorLineNr cterm=none ctermfg=green ctermbg=none
highlight LineNr ctermfg=darkgray ctermbg=none
highlight EndOfBuffer ctermbg=none ctermfg=darkgray
highlight SignColumn ctermbg=none
highlight ALEErrorSign ctermfg=darkred
highlight ALEWarningSign ctermfg=yellow
highlight ALEInfoSign ctermfg=blue

