" Installing vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Reload this vimrc file and install/update the following plugins with the
" command:
"   :PlugInstall
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') + '/plugged'
"     e.g., '~/.local/share/nvim/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'
" Binds 'gc' to toggle comments in visual mode
Plug 'tpope/vim-commentary'
" Syntax highlighting for Liquid templates
Plug 'tpope/vim-liquid'

" Binds some nifty, flighty navigation modes across a f ile
Plug 'easymotion/vim-easymotion'

" Any valid git URL is allowed
" Binds 's{char}{char}' as a quicker 'f' search
Plug 'https://github.com/justinmk/vim-sneak.git'

" Official Rust plugin
" To enable formatting with `rustfmt`:
" 1. Execute `rustup component add rustfmt`
" 2. Activate with :RustFmt command
Plug 'rust-lang/rust.vim'

" A file system explorer in Vim
Plug 'preservim/nerdtree'

" Lean & mean status/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" TODO: Experiment with LSP
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/async.vim'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" the glaive#Install() should go after the "call plug#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
"Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"


" First, install pathogen in your system with:
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"     curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()


" Airline customizations; experiment at runtime with `:AirlineTheme` command.
let g:airline_theme='solarized'


" NERDTree keybindings
nnoremap <C-t> :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument, and open a fresh
" buffer.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


set nocompatible
syntax on
filetype plugin indent on

set background=dark
colorscheme solarized

set hlsearch  " Clear highlights afterward with <C-l>; mapped by vim-sensible
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

