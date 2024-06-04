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
  { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x' },
  'MunifTanjim/nui.nvim',  -- Required for neo-tree
  'norcalli/nvim-colorizer.lua',
  'tpope/vim-fugitive',
  'nvim-tree/nvim-tree.lua',

  -- Language Support
  'vimwiki/vimwiki',
  'hashivim/vim-terraform',
  'Glench/Vim-Jinja2-Syntax',
  'Vimjas/vim-python-pep8-indent',
  'salkin-mada/openscad.nvim',
}

vim.g.nvim_tree_show_icons = {
  folders = 0,
  files = 0,
  git = 0,
  folder_arrows = 0,
}

require('nvim-tree').setup()

require('neo-tree').setup({
  filesystem = {
    window = {
      mappings = {
        ["/"] = "noop",
        ["o"] = "open",
        ["oc"] = "noop",
        ["od"] = "noop",
        ["og"] = "noop",
        ["om"] = "noop",
        ["on"] = "noop",
        ["os"] = "noop",
        ["ot"] = "noop",
      },
    }
  },
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

function is_windows()
  return package.config:sub(1,1) == '\\'
end
if is_windows() then
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

-- Filetype options
function buftab2()
  vim.bo.expandtab = true
  vim.bo.tabstop = 2
  vim.bo.shiftwidth = 2
end
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = buftab2
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = buftab2
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "openscad",
  callback = buftab2
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  callback = buftab2
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = buftab2
})

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
map('n', '<c-k>', ':cprev<CR>', opts)

map('n', '<c-p>', ':Telescope find_files<CR>', opts)
map('n', '<c-\\>', ':Neotree toggle<CR>', opts)

map('i', '<c-s-e>', '<esc>:Telescope emoji<CR>', opts)
map('n', '<c-s-e>', ':Telescope emoji<CR>', opts)
