call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-surround' " edit surrounding characters such as [] or <t></t>
Plug 'tpope/vim-commentary' " easier commenting
Plug 'tpope/vim-unimpaired' " use brackets and parentheses for useful shortcuts
Plug 'tpope/vim-repeat' " repeat plugin commands with .

call plug#end()

" tab settings 
set expandtab " fill tabs with spaces
set shiftwidth=4 " set indentation depth to 4
set softtabstop=4 " backspace over 4 spaces like tabs
set tabstop=4 " set tab length to 4
set autoindent " automatically set indent level

" interface
set linebreak " break by word when wrapping lines
set number " put the absolute line number on the line you're on
syntax enable " enable syntax highlighting

" search
set incsearch " incremental search (highlight as you go)
set ignorecase " ignore capitalization
set smartcase " unless you type a capital letter in the search

set background=dark " dark background for console
colorscheme gruvbox " set color scheme to gruvbox (must be installed)

inoremap kj <Esc>
inoremap jk <Esc>
nmap <space> <leader>
set wildcharm=<Tab>
nnoremap <leader>l :b <Tab>
