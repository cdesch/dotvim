" Activate pathogen.
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Explicitly set file encoding.
" set encoding=utf-8
" set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" Prevent vim from emulating vi bugs/limitations.
set nocompatible

" Specify colorscheme.
set t_Co=256
set background=dark
colorscheme molokai
let s:molokai_original=1
set cursorline

set title
set ruler                       " shows coordinates of cursor in bottom-right
set number                      " enable line-spacing
set scrolloff=3

" Set mapleader
let mapleader = ","

"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_WinWidth=50
map <F4> :TlistToggle<cr>
map <F3> :NERDTreeToggle<cr>
set tags=tags

" NERDTree Settings -------------------------------------
autocmd vimenter * NERDTree " Open NERDTree on vimenter
let NERDTreeShowHidden=1    " Show hidden files
let NERDTreeIgnore=['\.py[co]$', '\.DS_Store', '\.swp$']
" -------------------------------------------------------

" rvm.vim Settings ---------------
" Use default RVM on start
autocmd vimenter * Rvm use default
" --------------------------------

" MiniBufExplorer Settings
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplminiBufMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

filetype on
filetype plugin on
syntax on
set backspace=indent,eol,start " Backspace can delete ANYTHING
set autoindent
set smartindent
" Set tabstop, softtabstop, shiftwidth, and expandtab (soft tabs)
set ts=4 sts=4 sw=4 expandtab

set vb t_vb=                " prevents beeps on invalid commands
set incsearch               " performs search as text is entered
set ignorecase
set smartcase               " ignore case unless caps specified in search terms
set list                    " Show invisibles
set listchars=tab:▸\ ,eol:¬ " Use same chars for invisibles as TextMate

" set virtualedit=all         " allows cursor to free-roam
set wrap!                   " turn off word-wrap

" load server specific settings
if filereadable($HOME . '/.vimrc.local')
    source $HOME/.vimrc.local
endif

if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/languages/pythonrc
    autocmd BufRead,BufNewFile,FileReadPost *.rb source ~/.vim/languages/rubyrc
endif
