call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
      \ "signText": "△",
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
      \ "signText": "➤",
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
nnoremap <CR> i<CR><ESC>
nnoremap <Backspace> i<Backspace><right><Esc>
nnoremap <Space> i<Space><right><ESC>
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

let g:airline_left_sep=''
let g:airline_right_sep=''
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

""dein Scripts-----------------------------
"if &compatible
"  set nocompatible               " Be iMproved
"endif
"
"" Required:
"set runtimepath+=/Users/ryohei/.cache/dein/repos/github.com/Shougo/dein.vim
"
"" Required:
"if dein#load_state('/Users/ryohei/.cache/dein')
"  call dein#begin('/Users/ryohei/.cache/dein')
"
"  " Let dein manage dein
"  " Required:
"  call dein#add('/Users/ryohei/.cache/dein/repos/github.com/Shougo/dein.vim')
"
"  " Add or remove your plugins here like this:
"  "call dein#add('Shougo/neosnippet.vim')
"  "call dein#add('Shougo/neosnippet-snippets')
"  call dein#add('Shougo/deoplete.nvim')
"  let g:deoplete#enable_at_startup = 1
"  call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/bin/clang')
"
"
"  " Required:
"  call dein#end()
"  call dein#save_state()
"endif
"
"" Required:
"filetype plugin indent on
"syntax enable
"
"" If you want to install not installed plugins on startup.
""if dein#check_install()
""  call dein#install()
""endif
"

"filetype plugin indent on
"syntax enable

""End dein Scripts-------------------------
