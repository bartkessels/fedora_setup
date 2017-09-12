set exrc
set secure

colorscheme wwdc17
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set smartindent
set cindent

set number!
set numberwidth=5

set scrolloff=15
set cursorline

augroup project
    autocmd!
    autocmd! BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" Set path where to check for header files
let &path.="src,src/include,/usr/include/AL,"

" Load tags files
set tags+=/home/bkessels/.ctags/gtk_c

" GTK Syntax highlighting
runtime! syntax/c.vim

" Setup autocomplete with youcompleteme
let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_collect_identifiers_from_tags_files=1

" -----------------------------------------------------------------------------
" Setup NerdTree
" -----------------------------------------------------------------------------

" Start NERDTree if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' argv{}[0] | wincmd p | ene | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if no other files are open
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -----------------------------------------------------------------------------
" Shortcuts
" -----------------------------------------------------------------------------

map <C-n> :NERDTreeToggle<CR>
