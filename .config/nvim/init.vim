call plug#begin()

" Sensible Defaults
Plug 'tpope/vim-sensible'

" Core
Plug 'tpope/vim-surround' " edit surrounding characters such as [] or <t></t>
Plug 'tpope/vim-commentary' " easier commenting
Plug 'tpope/vim-unimpaired' " use brackets and parentheses for useful shortcuts
Plug 'tpope/vim-repeat' " repeat plugin commands with .

" Interface
Plug '~/.fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Language Support
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

call plug#end()

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Disable neovim version warning for go plugin
let g:go_version_warning = 0

au FileType markdown setlocal ts=2 sw=2 sts=2

" Interface
set background=dark
colorscheme gruvbox
set number
set mouse=a
set splitright
set splitbelow

" Behavior
set expandtab
set ts=4 sw=4 sts=4
set ignorecase
set smartcase
set linebreak

" Interface shortcuts
nnoremap <space>. :edit .<CR>
nnoremap <space>, :FZF<CR>
nnoremap <space>; :BufExplorer<CR>
nnoremap <space>/ :split<CR>
nnoremap <space>' :vsplit<CR>
nnoremap <space>w :w<CR>
nnoremap <space>q :q<CR>

" Easier copy/paste to system clipboard
nnoremap <space>p "*p
vnoremap <space>p "*p
nnoremap <space>y "*y
vnoremap <space>y "*y

" Diff shortcuts
nnoremap <space>dt :diffthis<CR>
nnoremap <space>da :windo diffthis<CR>
nnoremap <space>do :diffoff!<CR>
nnoremap <space>du :diffupdate<CR>

" Function key mappings
nnoremap <silent> <F1> :set hlsearch!<CR>

" Vim configuration mappings
nnoremap <space>vs :source $MYVIMRC<CR>
nnoremap <space>ve :edit $MYVIMRC<CR>
nnoremap <space>vi :PlugInstall<CR>

nnoremap <c-n> :cnext<CR>
nnoremap <c-p> :cprev<CR>

nnoremap <space>t ma:r!cd ~/templates/ && ls \| dmenu \| xargs cat<CR>'add
