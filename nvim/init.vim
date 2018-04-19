set rtp+="~/.config/nvim/snippets"

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-surround' " edit surrounding characters such as [] or <t></t>
Plug 'tpope/vim-commentary' " easier commenting
Plug 'tpope/vim-unimpaired' " use brackets and parentheses for useful shortcuts
Plug 'tpope/vim-repeat' " repeat plugin commands with .

" automation
Plug 'mattn/emmet-vim' " html abbreviations
Plug 'garbas/vim-snipmate' " code snippets and supporting plugins
Plug 'MarcWeber/vim-addon-mw-utils' 
Plug 'tomtom/tlib_vim'

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
set mouse=a " enable terminal mouse support
colorscheme gruvbox
set background=dark " dark background for console

" search
set incsearch " incremental search (highlight as you go)
set nohlsearch " don't highlight all search results by default
set ignorecase " ignore capitalization
set smartcase " unless you type a capital letter in the search


" Core remappings
inoremap kj <Esc>
inoremap jk <Esc>
map <space> <leader>
set wildcharm=<Tab>
nnoremap H 0
nnoremap L $

" Vim configuration shortcuts
nnoremap <leader>ve :edit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
nnoremap <leader>vp :edit $MYVIMRC<cr>gg/plug#end<cr>kOPlug ''<esc>i

" Diff shortcuts
nnoremap <leader>dt :windo diffthis
nnoremap <leader>do :diffoff!
nnoremap <leader>du :diffupdate

" Interface shortcuts
nnoremap <leader>l :b <Tab>
nnoremap <leader>t :NERDTree<cr>
nnoremap <leader>w :w<cr>

" F key shortcuts
nnoremap <silent> <f1> :set hlsearch!<cr>
