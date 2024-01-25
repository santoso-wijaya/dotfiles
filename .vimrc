" First, install pathogen in your system with:
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"     curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()

set nocompatible
syntax on
filetype plugin indent on

set background=dark
colorscheme solarized

set hlsearch
set ruler
set colorcolumn=80,120

set number
" toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

set backup                      " Be safe.
set history=1000                " Remember a lot.
set showcmd                     " Show the last command.
set showmatch                   " When a bracket is typed show its match.
set smarttab                    " Only respect shiftwidth for code indents.
set expandtab
set autoindent
set smartindent

