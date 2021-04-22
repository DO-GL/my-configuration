set backspace=indent,eol,start
syntax on
colorscheme slate 

set number
set ruler
set hlsearch
set showmatch
set t_Co=256
highlight clear MatchParen
highlight MatchParen cterm=bold ctermfg=red

inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set ai

" Python 79 char per line format PEP-8
set colorcolumn=79
