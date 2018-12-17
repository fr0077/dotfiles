syntax on

"前回編集した行まで移動
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
endif
"NerdTreeで開いているファイルに移動
autocmd BufEnter * silent! if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter * silent! lcd %:p:h
"Helpをqで閉じる
autocmd FileType help nnoremap <buffer> q <C-w>c
autocmd FileType c,cpp setlocal foldmethod=syntax

augroup cpp-path
  autocmd!
  autocmd FileType cpp setlocal path=/usr/local/opt/llvm/include/c++/v1,/usr/local/Cellar/boost/1.68.0/include,/usr/local/Cellar/gsl/2.5/include,/Applications/root_v6.14.06/include_compiler'
augroup END

call plug#begin()
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neosnippet'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
Plug 'kyouryuukunn/asyncomplete-neoinclude.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
call plug#end()

"autocmd BufEnter * call ncm2#enable_for_buffer()

"if executable('cquery')
"  autocmd User lsp_setup call lsp#register_server({
"        \ 'name': 'cquery',
"        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"        \ 'cmd': {server_info->['cquery']},
"        \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
"        \ 'whitelist': ['c', 'cpp'],
"        \ })
"endif

if executable('clangd')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#neoinclude#get_source_options({
      \ 'name': 'neoinclude',
      \ 'whitelist': ['c', 'cpp'],
      \ 'refresh_pattern': '\(<\|"\|/\)$',
      \ 'completor': function('asyncomplete#sources#neoinclude#completor'),
      \ }))

source ~/Documents/Programming/Library/vim/commands.vim

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
inoremap <Esc> <Esc>

let s:my_snippet = '~/Documents/Programming/Library/vim/snip'
let g:neosnippet#snippets_directory = s:my_snippet
let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ }
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_remove_duplicates = 1

let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error= {'text': '✘'}
let g:lsp_signs_warning = {'text': '❖'}
let g:lsp_signs_hint = {'text': '✒'}
let g:lsp_signs_information = {'text': 'ℹ'}

let g:airline_theme='wombat'
let g:NERDDefaultAlign='left'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let mapleader = "\<Space>"

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" smart indent when entering insert mode with i on empty lines
function! IndentWithI()
  if len(getline('.')) == 0
    return "cc"
  else
    return "i"
  endif
endfunction

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_target)
nnoremap <expr> i IndentWithI()
nnoremap Y y$
nnoremap ; :
nnoremap : ;
"nnoremap  <Leader>d :call LanguageClient#textDocument_definition()<CR>
"nnoremap  <Leader>r :call LanguageClient#textDocument_rename()<CR>
"nnoremap  <Leader>f :call LanguageClient#textDocument_formatting()<CR>
nnoremap <Leader>r :LspRename<CR>
nnoremap <Leader>f :LspDocumentFormat<CR>
nnoremap <Leader>i :LspImplementation<CR>
nnoremap <Leader>d :LspDefinition<CR>
nnoremap <Esc><Esc> :noh<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <A-p> :pu<CR>
nnoremap j gj
nnoremap k gk
nnoremap <c-Space> za
vnoremap c <nop>
inoremap <silent> jj <ESC>
noremap <C-l> <C-g>U<Right>
noremap <C-h> <C-g>U<Left>
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

set gdefault
set foldlevel=2
set cmdheight=2
set pumheight=15
set completeopt=noinsert,menuone,noselect
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

highlight Folded ctermbg=none
highlight LspErrorText ctermfg=red
highlight LspWarningText ctermfg=yellow
highlight LspHintText ctermfg=blue
highlight LspInformationText ctermfg=blue
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
highlight Pmenu ctermbg=darkgray ctermfg=white
highlight PmenuSel ctermbg=green

