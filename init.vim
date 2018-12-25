syntax on

let mapleader = "\<Space>"

call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'osyo-manga/vim-anzu'
call plug#end()

"----------Plugin----------
""LanguageClient-neovim
"let g:LanguageClient_serverCommands = {
"      \ 'c': ['clangd'],
"      \ 'cpp': ['clangd'],
"      \ }
let g:LanguageClient_serverCommands = {
      \ 'c': ['cquery',
      \ '--init={"cacheDirectory":"/tmp/cquery/cache"}'],
      \ 'cpp': ['cquery',
      \ '--init={"cacheDirectory":"/tmp/cquery/cache"}'],
      \ }
let g:LanguageClient_diagnosticsDisplay = {
      \   1: {
      \   "name": "Error",
      \   "texthl": "ALEError",
      \   "signText": "✘",
      \   "signTexthl": "ALEErrorSign",
      \   },
      \   2: {
      \   "name": "Warning",
      \   "texthl": "ALEWarning",
      \   "signText": "❖",
      \   "signTexthl": "ALEWarningSign",
      \   },
      \   3: {
      \   "name": "Information",
      \   "texthl": "ALEInfo",
      \   "signText": "ℹ",
      \   "signTexthl": "ALEInfoSign",
      \   },
      \   4: {
      \   "name": "Hint",
      \   "texthl": "ALEInfo",
      \   "signText": "♬",
      \   "signTexthl": "ALEInfoSign",
      \   },
      \ }
highlight ALEErrorSign ctermfg=red
highlight ALEWarningSign ctermfg=yellow
highlight ALEInfoSign ctermfg=blue

nnoremap <Leader>d :call LanguageClient#textDocument_definition()<CR>
"nnoremap <Leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <Leader>= :call LanguageClient#textDocument_formatting()<CR>

""vim-lsp
"if executable('clangd')
"  autocmd User lsp_setup call lsp#register_server({
"        \ 'name': 'clangd',
"        \ 'cmd': {server_info->['clangd']},
"        \ 'whitelist': ['c', 'cpp'],
"        \ })
"endif
""if executable('cquery')
""  autocmd User lsp_setup call lsp#register_server({
""        \ 'name': 'cquery',
""        \ 'cmd': {server_info->['cquery']},
""        \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
""        \ 'whitelist': ['c', 'cpp']
""        \ })
""endif
"let g:lsp_signs_enabled = 1
"let g:lsp_diagnostics_echo_cursor = 1
"let g:lsp_signs_error= {'text': '✘'}
"let g:lsp_signs_warning = {'text': '❖'}
"let g:lsp_signs_hint = {'text': '✒'}
"let g:lsp_signs_information = {'text': 'ℹ'}
"highlight LspErrorText ctermfg=red
"highlight LspWarningText ctermfg=yellow
"highlight LspHintText ctermfg=blue
"highlight LspInformationText ctermfg=blue
"nnoremap <Leader>r :LspRename<CR>
"nnoremap <Leader>= :LspDocumentFormat<CR>
"nnoremap <Leader>i :LspImplementation<CR>
"nnoremap <Leader>d :LspDefinition<CR>

"deoplete
let g:deoplete#enable_at_startup = 1

""ncm2
"autocmd BufEnter * call ncm2#enable_for_buffer()

""asyncomplete
"let g:asyncomplete_smart_completion = 1
"let g:asyncomplete_auto_popup = 1
"let g:asyncomplete_remove_duplicates = 1
""autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#neoinclude#get_source_options({
""      \ 'name': 'neoinclude',
""      \ 'whitelist': ['c', 'cpp'],
""      \ 'refresh_pattern': '\(<\|"\|/\)$',
""      \ 'completor': function('asyncomplete#sources#neoinclude#completor'),
""      \ }))
""autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
""      \ 'name': 'file',
""      \ 'whitelist': ['*'],
""      \ 'priority': 10,
""      \ 'completor': function('asyncomplete#sources#file#completor')
""      \ }))

"NERDCommenter
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

"NERDTree
autocmd BufEnter * silent! if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDCreateDefaultMappings = 0
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultAlign='left'
nnoremap <Leader>t :NERDTreeToggle<CR>

"vim-anzu
nmap <silent> n <Plug>(anzu-n-with-echo)
nmap <silent> N <Plug>(anzu-N-with-echo)
nmap <silent> * <Plug>(anzu-star-with-echo)
nmap <silent> # <Plug>(anzu-sharp-with-echo)
nnoremap <silent> <Esc><Esc> :noh<CR> <bar> <Plug>(anzu-clear-search-status)
set statusline=%{anzu#search_status()}

"----------Normal----------
command Color :so $VIMRUNTIME/syntax/colortest.vim
command Setting :e ~/.dotfiles/init.vim
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
autocmd BufEnter * silent! lcd %:p:h
autocmd FileType help nnoremap <buffer> q <C-w>c
autocmd FileType c,cpp setlocal foldmethod=syntax
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
nnoremap Y y$
nnoremap ; :
nnoremap : ;
function! IndentWithI()
  if len(getline('.')) == 0
    return "cc"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()
nnoremap <A-p> :pu<CR>
nnoremap j gj
nnoremap k gk
nnoremap <Leader>f za
nnoremap Q <Nop>
vnoremap c <nop>
inoremap <silent> jj <ESC><Right>
noremap <C-l> <C-g>U<Right>
noremap <C-h> <C-g>U<Left>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <c-c> <ESC>

set gdefault
set foldlevel=2
set cmdheight=2
set pumheight=15
set completeopt=noinsert,menuone,noselect
set signcolumn=yes
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

