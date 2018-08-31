set rtp+="~/.config/nvim/snippets"

call plug#begin('~/.config/nvim/plugged')

" Interface
Plug 'junegunn/fzf'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'

" Core
Plug 'tpope/vim-surround' " edit surrounding characters such as [] or <t></t>
Plug 'tpope/vim-commentary' " easier commenting
Plug 'tpope/vim-unimpaired' " use brackets and parentheses for useful shortcuts
Plug 'tpope/vim-repeat' " repeat plugin commands with .

" Automation
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
set wildcharm=<Tab>

" Vim configuration shortcuts
nnoremap <space>ve :edit $MYVIMRC<CR>
nnoremap <space>vs :source $MYVIMRC<CR>
nnoremap <space>vp :edit $MYVIMRC<CR>gg/plug#end<CR>kOPlug ''<esc>i
nnoremap <space>vi :PlugInstall<CR>

" Diff shortcuts
nnoremap <space>dt :windo diffthis
nnoremap <space>do :diffoff!
nnoremap <space>du :diffupdate

" Interface shortcuts
nnoremap <space>w :w<CR>
nnoremap <space>q :q<CR>
nnoremap <space>. :edit .<CR>
nnoremap <space>' :vnew<CR>
nnoremap <space>/ :new<CR>
nnoremap <space>, :FZF<CR>
nnoremap <space>; :BufExplorer<CR>

" Easier system clipboard access
nnoremap <space>y "*y
nnoremap <space>p "*p
vnoremap <space>y "*y
vnoremap <space>p "*p

" F key shortcuts
nnoremap <silent> <F1> :set hlsearch!<CR>
