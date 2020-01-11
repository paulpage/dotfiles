call plug#begin()

" Core
Plug 'tpope/vim-surround' " edit surrounding characters such as [] or <t></t>
Plug 'tpope/vim-commentary' " easier commenting
Plug 'tpope/vim-unimpaired' " use brackets and parentheses for useful shortcuts
Plug 'tpope/vim-repeat' " repeat plugin commands with .
Plug 'tpope/vim-sleuth' " auto detect indent

" Interface
Plug '~/.fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/norcalli/nvim-colorizer.lua'

" Language Support
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'elixir-editors/vim-elixir'
Plug 'ianks/vim-tsx'

call plug#end()

set nocompatible " No vi compatibility
filetype plugin indent on " filetype detection, plugins, and indents
set number " line numbers
set backspace=indent,eol,start " reasonable backspace
set showmode " show current mode
set splitright " open vertical splits to the right
set splitbelow " open horizontal splits below
set encoding=utf-8 " default file encoding
set laststatus=2 " always show statusbar
set ruler " always show cursor position
set fileformats=unix,dos,mac " prefer file formats in this order
set incsearch " show search as I'm typing
set nohlsearch " don't highlight search matches
set ignorecase " ignore search case...
set smartcase " unless I have an uppercase letter
syntax enable " enable syntax highlighting
syntax sync minlines=256 " make syntax highlighting better
set synmaxcol=300 " Don't highlight beyond 300 columns
set conceallevel=0 " don't fold
set wrap " wrap lines
set autoindent " automatically indent
set linebreak " break lines on words
set breakindent " indent all wrapped lines to same level as the first
set smarttab " treat spaces as tabs if applicable
set expandtab " spaces instead of tabs
set ts=4 sts=4 sw=4 " default tab width of 4
set mouse=a " mouse
let g:netrw_dirhistmax=0 " don't save netrw history
set termguicolors " 24 bit color in the TUI
set background=dark " use colors that look good on a dark background
colorscheme gruvbox " TODO check if it exists first
set nrformats-=octal " don't use octal
set complete-=i " don't search include files
set wildmenu " enable nice command autocomplete
if empty(mapcheck('<C-U>', 'i')) " let you undo <c-u>
    inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i')) " let you undo <c-w>
    inoremap <C-W> <C-G>u<C-W>
endif

lua require 'colorizer'.setup()
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
let g:go_version_warning = 0 " Disable neovim version warning for go plugin
let b:nroff_is_groff = 1 " Enable groff extensions

au FileType markdown setlocal ts=2 sw=2 sts=2

" Interface shortcuts
nnoremap <space>. :edit .<CR>
nnoremap <space>, :FZF<CR>
nnoremap <space>; :BufExplorer<CR>
nnoremap <space>/ :split<CR>
nnoremap <space>' :vsplit<CR>
nnoremap <space>w :w<CR>
nnoremap <space>q :q<CR>

" Easier copy/paste to system clipboard
nnoremap <space>p "+p
vnoremap <space>p "+p
nnoremap <space>y "+y
vnoremap <space>y "+y

" Diff shortcuts
nnoremap <space>dt :diffthis<CR>
nnoremap <space>da :windo diffthis<CR>
nnoremap <space>do :diffoff!<CR>
nnoremap <space>du :diffupdate<CR>

" Function key mappings
nnoremap <silent> <F1> :set hlsearch!<CR>
nnoremap          <F5> :make<CR>

" Vim configuration mappings
nnoremap <space>vs :source $MYVIMRC<CR>
nnoremap <space>ve :edit $MYVIMRC<CR>
nnoremap <space>vi :PlugInstall<CR>

nnoremap <c-n> :cnext<CR>
nnoremap <c-p> :cprev<CR>

nnoremap <space>t ma:r!cd ~/templates/ && ls \| dmenu \| xargs cat<CR>'add
nnoremap <F29> :nnoremap <F5> :<c-v><CR<c-v>><left><left><left><left>

nnoremap <c-s> :write<CR>

tnoremap <c-w>w <c-\><c-n><c-w>w
tnoremap <c-w><c-w> <c-\><c-n><c-w>w

function! SwitchTo(pattern)
    let windowNr = bufwinnr(a:pattern)
    if windowNr > 0
        execute windowNr 'wincmd w'
    endif  
endfunction

let g:makecmd = 'make'
nnoremap <m-t> :call SwitchTo('term')<CR>amake<CR><c-\><c-n><c-w><c-w>
