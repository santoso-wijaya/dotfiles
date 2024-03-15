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
" Binds 'gc' to toggle comments in Visual mode, and 'gcc' in Normal mode
Plug 'tpope/vim-commentary'
" Syntax highlighting for Liquid templates
Plug 'tpope/vim-liquid'
" `aj`: textobject for the outermost JSON object; `gqaj`: to pretty print, etc
Plug 'tpope/vim-jdaddy'
" Automatically append `endfunction` tokens for supported languages
Plug 'tpope/vim-endwise'
" Surround a selection or textobject under cursor with quotes, HTML tags, etc
Plug 'tpope/vim-surround'

" fzf is a general-purpose command-line fuzzy finder
" :FZF command invokes the basic file selector
" Open selected files with <CR>, <C-T>, <C-X>, or <C-V> for current window,
" new tab, horizontal split, and vertical split respectively.
Plug 'junegunn/fzf', { 'do': { -> fz#install() }}   " with a post-update hook

" Binds some nifty, flighty navigation modes across a file
Plug 'easymotion/vim-easymotion'

Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-css-color'

" Any valid git URL is allowed
" Display and manage marks in the gutter
Plug 'https://github.com/kshenoy/vim-signature.git'

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

" Using CoC for LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Adds icons to popular plugins
" Requires: a Nerd Font installed and used
Plug 'ryanoasis/vim-devicons'

if has('nvim')
  Plug 'echasnovski/mini.nvim'
  " Open folders as vim buffers and manipulate files
  Plug 'stevearc/oil.nvim'
endif

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()


" Airline customizations; experiment at runtime with `:AirlineTheme` command.
let g:airline_theme='solarized'
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" Disable unless the system/terminal uses Powerline or Nerd Fonts.
let g:airline_powerline_fonts = 1

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#nerdtree_statusline = 1

" devicons settings
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1


" NERDTree settings
let g:NERDTreeShowHidden = 1
" NERDTree keybindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument, and open a fresh
" buffer.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree')
    \ && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+'
    \ && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" fzf settings
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


set nocompatible
set encoding=UTF-8
syntax on
filetype plugin indent on

syntax enable
set background=light
colorscheme solarized
" Terminal colors for solarized color scheme
if has('nvim')
  let g:terminal_color_0 = '#002b36'  " brblack
  let g:terminal_color_1 = '#073642'  " black
  let g:terminal_color_2 = '#586e75'  " brgreen
  let g:terminal_color_3 = '#657b83'  " bryellow
  let g:terminal_color_4 = '#839496'  " brblue
  let g:terminal_color_5 = '#93a1a1'  " brcyan
  let g:terminal_color_6 = '#eee8d5'  " white
  let g:terminal_color_7 = '#fdf6e3'  " brwhite
  let g:terminal_color_8 = '#b58900'  " yellow
  let g:terminal_color_9 = '#cb4b16'  " brred
  let g:terminal_color_10 = '#dc322f' " red
  let g:terminal_color_11 = '#d33682' " magenta
  let g:terminal_color_12 = '#6c71c4' " brmagenta
  let g:terminal_color_13 = '#268bd2' " blue
  let g:terminal_color_14 = '#2aa198' " cyan
  let g:terminal_color_15 = '#859900' " green
else
  let g:terminal_ansi_colors = [
    \ '#002b36', '#073642', '#586e75', '#657b83',
    \ '#839496', '#93a1a1', '#eee8d5', '#fdf6e3',
    \ '#b58900', '#cb4b16', '#dc322f', '#d33682',
    \ '#6c71c4', '#268bd2', '#2aa198', '#859900'
  \ ]
endif

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

if !has('nvim')
  " To escape the auto-closer here, use <C-v> in insert mode.
  inoremap " ""<left>
  inoremap ' ''<left>
  inoremap ( ()<left>
  inoremap [ []<left>
  inoremap { {}<left>
  inoremap {<CR> {<CR>}<ESC>O
  inoremap {;<CR> {<CR>};<ESC>O
  " On nvim, the above is not necessary; they are superseded by mini.pairs
endif

" Remap activator for vim-easymotion to match mini.jump2d
" e.g. <Leader>w to search for jump anchors to words forward in visible buffer
"      With mini.jump2d, though, <Leader><Leader> activates a similar function.
nnoremap <Leader> <Plug>(easymotion-prefix)
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{char}{label}`
nmap s <Plug>(easymotion-overwin-f2)
" Set the characters used for jump marker name; lowercase only to avoid chording
let g:EasyMotion_keys = 'hklyuiopnm,qwertzxcvbasdgjf;'

" CoC-recommended settings below

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn (the 'gutter'), otherwise it would shift the text
" each time diagnostics appear/become resolved.
" The gutter is also useful for displaying marks, diff symbols, etc.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` command to get all diagnostics of current buffer in
" location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
" scheme that clashes with solarized, making it hard to see.
" I copied these color settings from current PMenu values from :hi
highlight CocFloating cterm=reverse ctermfg=11 ctermbg=7 guibg=LightMagenta

" end CoC-recommended settings above

" My CoC settings

" Disable auto-complete suggestions in Markdown files
autocmd FileType markdown let b:coc_suggest_disable = 1

" CoC extensions settings below

" Use :Prettier to format the current buffer by coc-prettier.
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" end CoC extensions settings above


if has('nvim')
  lua require('init')
endif

