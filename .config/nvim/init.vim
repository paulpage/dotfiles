call plug#begin()

" Core
Plug 'tpope/vim-surround' " edit surrounding characters such as [] or <t></t>
Plug 'tpope/vim-commentary' " easier commenting
Plug 'tpope/vim-unimpaired' " use brackets and parentheses for useful shortcuts
Plug 'tpope/vim-repeat' " repeat plugin commands with .

Plug 'PeterRincker/vim-argumentative' " Manipulate function arguments

" Interface
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'romainl/Apprentice'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'

" Language Support
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'elixir-editors/vim-elixir'
Plug 'ianks/vim-tsx'
Plug 'tikhomirov/vim-glsl'
Plug 'Tetralux/odin.vim'
Plug 'ziglang/zig.vim'
Plug 'vimwiki/vimwiki'

Plug 'xiyaowong/telescope-emoji.nvim'

call plug#end()

lua require("telescope").load_extension("emoji")

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
let c_no_curly_error = 1

" lua require 'colorizer'.setup()
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
let g:go_version_warning = 0 " Disable neovim version warning for go plugin
let b:nroff_is_groff = 1 " Enable groff extensions

if has('win32')
    let g:vimwiki_list = [{'path': 'C:\dev\wiki',
                          \ 'syntax': 'markdown', 'ext': '.md'}]
else
    let g:vimwiki_list = [{'path': '~/wiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]
endif

" source ~/src/light_colorscheme.vim

" if exists("g:nvy")
"     set mousescroll=ver:1
" endif

au FileType markdown setlocal ts=2 sw=2 sts=2
au FileType vimwiki setlocal ts=2 sw=2 sts=2

au FileType markdown inoremap <buffer> <tab> <c-t>
au FileType vimwiki inoremap <buffer> <tab> <c-t>

au FileType glsl setlocal commentstring=//\ %s

au FileType odin setlocal errorformat+=%f(%l:%c)\ %m

" Interface shortcuts
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
nnoremap          <F6> :make run<CR>

" Vim configuration mappings
nnoremap <space>vs :source $MYVIMRC<CR>
nnoremap <space>ve :edit $MYVIMRC<CR>
nnoremap <space>vi :PlugInstall<CR>

nnoremap <c-j> :cnext<CR>
nnoremap <c-k> :cprev<CR>
nnoremap <c-p> :Telescope find_files<CR>

function! ToggleFileManager()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    NERDTreeClose
  else
    NERDTree
  endif
endfunction
nnoremap <silent> <c-\> :call ToggleFileManager()<CR>

nnoremap <space>t ma:r!cd ~/templates/ && ls \| dmenu \| xargs cat<CR>'add

nnoremap <C-F5> :nnoremap <F5> :<c-v><CR<c-v>><left><left><left><left>
nnoremap <F29> :nnoremap <F5> :<c-v><CR<c-v>><left><left><left><left>
nnoremap <C-F6> :nnoremap <F6> :<c-v><CR<c-v>><left><left><left><left>
nnoremap <F30> :nnoremap <F6> :<c-v><CR<c-v>><left><left><left><left>

nnoremap <c-s> :write<CR>

tnoremap <c-w>w <c-\><c-n><c-w>w
tnoremap <c-w><c-w> <c-\><c-n><c-w>w

function! SwitchToTerminal()
    let windowNr = bufwinnr('TERM')
    if windowNr > 0
        execute windowNr 'wincmd w'
    else
        split
        term
        file TERM
    endif  
endfunction

let g:makecmd = 'make'
nnoremap <m-t> :call SwitchTo('term')<CR>amake<CR><c-\><c-n><c-w><c-w>

function! SwitchHeaderImpl()
    if expand('%<').'.cpp' ==? expand('%') || expand('%<').'.c' ==? expand('%')
        if filereadable(expand('%<').'.h')
            edit %<.h
        elseif filereadable(expand('%<.').'.hpp')
            edit %<.hpp
        elseif filereadable(expand('%<.').'.H')
            edit %<.H
        elseif filereadable(expand('%<').'.HPP')
            edit %<.HPP
        endif
    elseif expand('%<').'.h' ==? expand('%') || expand('%<').'.hpp' ==? expand('%')
    echo 'h'
        if filereadable(expand('%<').'.c')
            edit %<.c
        elseif filereadable(expand('%<').'.cpp')
            edit %<.cpp
        elseif filereadable(expand('%<')'.C')
            edit %<.C
        elseif filereadable(expand('%<').'.CPP')
            edit %<.CPP
        endif
    endif

    " Jump to last known cursor position
    if line("'\"") > 1 && line("'\"") <= line("$") |
      exe "normal! g`\"zz" |
    endif
endfunction
nnoremap <F4> :call SwitchHeaderImpl()<CR>
inoremap <F4> <c-o>:call SwitchHeaderImpl()<CR>

inoremap <c-a><c-d> <esc>a<space><esc>60a=<esc>

inoremap <c-s-e> <esc>:Telescope emoji<CR>
nnoremap <c-s-e> :Telescope emoji<CR>
