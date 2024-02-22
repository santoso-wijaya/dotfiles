" Installing vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'

Plug 'easymotion/vim-easymotion'

" Any valid git URL is allowed
Plug 'https://github.com/justinmk/vim-sneak.git'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


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
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

" Do not clutter the current directory with swap, backup, undo files.
set swapfile
set directory=.swp/,~/.swp/,/tmp//
set backupdir=.backup/,~/.backup/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

