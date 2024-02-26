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

" Using CoC for LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument, and open a fresh
" buffer.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


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

" CoC-recommended settings below

set nobackup
set nowritebackup

set updatetime=300

set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` command to get all diagnostics of current buffer in
" location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" The default PMenu (floating selection menu box) that appears has a color
" scheme that clashes with solarized-dark, making it hard to see.
" I copied these color settings from current PMenu values from :hi
highlight CocFloating cterm=reverse ctermfg=12 ctermbg=0 guibg=Magenta

" end CoC-recommended settings above

