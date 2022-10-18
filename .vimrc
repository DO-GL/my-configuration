colorscheme slate 
syntax on
filetype plugin indent on

set backspace=indent,eol,start
set number
set ruler
set hlsearch
set showmatch
set t_Co=256

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set textwidth=79

set ai
highlight clear MatchParen
highlight MatchParen cterm=bold ctermfg=red

inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
