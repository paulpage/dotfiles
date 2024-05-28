-- Packages
require 'paq' {
    'savq/paq-nvim',

    -- Editing
    'tpope/vim-unimpaired',
    'PeterRincker/vim-argumentative',

    -- Interface
    'nvim-lua/plenary.nvim', -- Required for telescope, neo-tree
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x' },
    'xiyaowong/telescope-emoji.nvim',
    -- 'nvim-tree/nvim-tree.lua',
    { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x' },
    'MunifTanjim/nui.nvim',  -- Required for neo-tree
    'norcalli/nvim-colorizer.lua',

    -- Language Support
    'vimwiki/vimwiki',
    -- 'hashivim/vim-terraform',
    -- 'Glench/Vim-Jinja2-Syntax',
    -- 'Vimjas/vim-python-pep8-indent',
}

require('neo-tree').setup({
    enable_git_status = false,
    default_component_configs = {
        icon = {
            folder_closed = '>',
            folder_open = 'v',
            folder_empty_closed = '>',
            folder_empty = 'v',
            default = ' ',
            highlight = 'NeoTreeFileIcon',
        },
        name = {
            trailing_slash = true,
        },
    },
})

require('telescope').load_extension('emoji')

vim.o.termguicolors = true
require('colorizer').setup()

if vim.fn.has('win32') then
    vim.g.vimwiki_list = {{path = 'C:\\notes', syntax = 'markdown', ext = '.md'}}
else
    vim.g.vimwiki_list = {{path = '~/notes', syntax = 'markdown', ext = '.md'}}
end

-- Options
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.number = true

vim.g.c_no_curly_error = true

-- Keymaps
local map = vim.api.nvim_set_keymap
local opts = { noremap = true }
map('n', '<space>w', ':w<CR>', opts)
map('n', '<space>q', ':q<CR>', opts)

map('n', '<space>p', '"*p', opts)
map('n', '<space>y', '"*y', opts)
map('v', '<space>p', '"*p', opts)
map('v', '<space>y', '"*y', opts)

map('n', '<space>dt', ':diffthis<CR>', opts)
map('n', '<space>da', ':windo diffthis<CR>', opts)
map('n', '<space>do', ':diffoff!<CR>', opts)
map('n', '<space>du', ':diffupdate<CR>', opts)

map('n', '<space>vs', ':source $MYVIMRC<CR>', opts)
map('n', '<space>ve', ':edit $MYVIMRC<CR>', opts)
map('n', '<space>vi', ':PaqSync<CR>', opts)

map('n', '<c-j>', ':cnext<CR>', opts)
map('n', '<c-k>', ':cnext<CR>', opts)

map('n', '<c-p>', ':Telescope find_files<CR>', opts)
map('n', '<c-\\>', ':Neotree toggle<CR>', opts)  -- TODO validate or port refresh capability

map('i', '<c-s-e>', '<esc>:Telescope emoji<CR>', opts)
map('n', '<c-s-e>', ':Telescope emoji<CR>', opts)
