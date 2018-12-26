syntax on

"----------Normal----------
nnoremap ; :
nnoremap : ;
nnoremap Q <Nop>
vnoremap c <nop>
inoremap <silent> jj <ESC><Right>
inoremap <c-c> <ESC>

set number
set tabstop=4
set title
set list
set listchars=tab:→-,trail:-,extends:»,precedes:«,nbsp:@
set visualbell t_vb=
set noerrorbells
set autoread

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

