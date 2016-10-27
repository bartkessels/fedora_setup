syntax on 
 
set ruler 
set ttyfast 
set mouse=a 
set ttymouse=xterm2 
 
" TABS 
 
set tabstop=2 
set shiftwidth=2 
set shiftround 
set expandtab
set autoindent 
set cindent 
 
" LINE NUMBERS 
 
set number 
set numberwidth=5 
highlight lineNr ctermfg=black ctermbg=gray 
highlight Normal ctermfg=gray ctermbg=black 
colorscheme desert

" SPLIT WINDOWS 
 
set splitbelow 
set splitright 
 
" HTML 
 
set matchpairs+=<:>
let g:html_indent_tags="li\|p"
