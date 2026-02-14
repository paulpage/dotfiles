-- Packages
require 'paq' {
  'savq/paq-nvim',

  -- Editing
  'tpope/vim-unimpaired',
  'tpope/vim-commentary',
  'PeterRincker/vim-argumentative',

  -- Interface
  'nvim-lua/plenary.nvim', -- Required for telescope, neo-tree
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x' },
  'xiyaowong/telescope-emoji.nvim',
  { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x' },
  'MunifTanjim/nui.nvim',  -- Required for neo-tree
  'norcalli/nvim-colorizer.lua',
  'tpope/vim-fugitive',
  'morhetz/gruvbox',
  'junegunn/goyo.vim',

  -- Language Support
  'vimwiki/vimwiki',
  -- 'serenevoid/kiwi.nvim',
  -- 'lervag/wiki.vim',
  'hashivim/vim-terraform',
  'Glench/Vim-Jinja2-Syntax',
  'Vimjas/vim-python-pep8-indent',
  'salkin-mada/openscad.nvim',
  'neovim/nvim-lspconfig',
  'tikhomirov/vim-glsl',
  -- 'nvim-treesitter/nvim-treesitter',
  'kalvinpearce/ShaderHighlight',
  'mattn/calendar-vim',
}

vim.lsp.config('clangd', {
  filetypes = { 'c' },
})
vim.lsp.enable('clangd')

vim.lsp.config('ols', {})
vim.lsp.enable('ols')


-- require('nvim-treesitter.configs').setup {
--     ensure_installed = { "markdown", "markdown_inline" },
--     highlight = {
--         enable = true,
--     },
-- }

-- require('lspconfig').rust_analyzer.setup {
--   settings = {
--     ['rust-analyzer'] = {
--       check = {
--         command = "clippy";
--       },
--       diagnostics = {
--         enable = true;
--       }
--     }
--   }
-- }

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
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = require('telescope.actions').close,
            },
        },
    },
})

function is_windows()
  return package.config:sub(1,1) == '\\'
end

if is_windows() then
  vim.opt.shellslash = true
end

vim.cmd[[colorscheme gruvbox]]
if vim.g.neovide then
  if is_windows() then
    vim.o.guifont = "Consolas:h12"
  else
    vim.o.guifont = "Dejavu Sans Mono:h12"
  end
  vim.g.neovide_scroll_animation_length = 0.05
  vim.g.neovide_cursor_animation_length = 0
  vim.opt.mousescroll = "ver:5,hor:2"
else
  -- Use terminal background in terminal
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NonText', { bg = 'none' })
end

vim.o.termguicolors = true
require('colorizer').setup()

if is_windows() then
  vim.g.wiki_location = 'C:\\notes'
  vim.g.vimwiki_list = {{path = 'C:\\notes', syntax = 'markdown', ext = '.md', listsyms = ' .ox'}}
else
  vim.g.wiki_location = '~/notes'
  vim.g.vimwiki_list = {{path = '~/notes', syntax = 'markdown', ext = '.md', listsyms=' .ox'}}
end
vim.g.markdown_sytax_conceal = 2

-- Options
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.number = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.shellslash = true

vim.opt.breakindentopt:append("list:2")

vim.g.c_no_curly_error = true
vim.o.cinoptions = "(s,m1"
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "r", "o" })
  end,
}) -- no comment continuation after newline

-- vim.cmd[[colorscheme gruvbox]]
vim.cmd[[colorscheme peachpuff]]
vim.cmd[[set bg=light]]
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NonText', { bg = 'none' })

-- Filetype options
function buftab(filetype, space_count)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function()
      vim.bo.expandtab = true
      vim.bo.tabstop = space_count
      vim.bo.shiftwidth = space_count
    end
  })
end

function bufmap(filetype, mode, key, action)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, mode, key, action, opts)
    end
  })
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "hlsl",
    callback = function()
        vim.bo.commentstring = "// %s"
    end
})

buftab("markdown", 2)
buftab("vimwiki", 2)
buftab("yaml", 2)
buftab("openscad", 2)
buftab("html", 2)
buftab("lua", 2)

font = "Consolas"
font_size = 12
function adjust_font_size(inc)
    font_size = math.max(1, font_size + inc)
    vim.o.guifont = font .. ":h" .. font_size
end

-- Keymaps
local map = vim.api.nvim_set_keymap
local opts = { noremap = true }
local opts_silent = { noremap = true, silent = true }
map('n', '<space>w', ':w<CR>', opts)
map('n', '<space>q', ':q<CR>', opts)

map('n', '<space>p', '"+p', opts)
map('n', '<space>y', '"+y', opts)
map('v', '<space>p', '"+p', opts)
map('v', '<space>y', '"+y', opts)

map('n', '<space>dt', ':diffthis<CR>', opts)
map('n', '<space>da', ':windo diffthis<CR>', opts)
map('n', '<space>do', ':diffoff!<CR>', opts)
map('n', '<space>du', ':diffupdate<CR>', opts)

map('n', '<space>vs', ':source $MYVIMRC<CR>', opts)
map('n', '<space>ve', ':edit $MYVIMRC<CR>', opts)
map('n', '<space>vi', ':PaqSync<CR>', opts)

map('n', '<c-j>', ':cnext<CR>', opts)
map('n', '<c-k>', ':cprev<CR>', opts)

-- map('n', '<c-p>', ':Telescope find_files<CR>', opts)
map('n', '<c-b>', ':Telescope buffers<CR>', opts)
map('n', '<c-\\>', ':Neotree toggle<CR>', opts)
vim.keymap.set("n", "<c-p>", function()
  require("telescope.builtin").find_files({
    hidden = true,
    file_ignore_patterns = { "^%.git/" }, -- exclude .git folder
    -- no_ignore = false,
  })
end)

map('i', '<c-s-e>', '<esc>:Telescope emoji<CR>', opts)
map('n', '<c-s-e>', ':Telescope emoji<CR>', opts)

map('n', '<C-F5>', ':nnoremap <F5> <LT>CR><left><left><left><left>', opts)
map('n', '<F29>', ':nnoremap <F5> <LT>CR><left><left><left><left>', opts)
map('n', '<C-F6>', ':nnoremap <F6> <LT>CR><left><left><left><left>', opts)
map('n', '<F30>', ':nnoremap <F6> <LT>CR><left><left><left><left>', opts)

map('n', '<F5>', ':make<CR>', opts)
map('n', '<F6>', ':make run<CR>', opts)

bufmap('rust', 'n', '<F5>', ':Cargo check<CR>a')
bufmap('rust', 'n', '<F6>', ':Cargo run<CR>a')

-- map('n', '<c-l>', ':tcd ', opts)
map('n', '<c-t>', ':tabe<CR>', opts)

vim.keymap.set('n', '<leader>ww', function()
  vim.cmd('tcd ' .. vim.g.wiki_location)
  vim.cmd('VimwikiTabIndex')
end, opts)

map('n', '<c-tab>', ':tabnext<CR>', opts)
map('n', '<c-s-tab>', ':tabprevious<CR>', opts)

map('n', '<c-scrollwheelup>', ':lua adjust_font_size(1)<CR>', opts_silent)
map('n', '<c-scrollwheeldown>', ':lua adjust_font_size(-1)<CR>', opts_silent)

map('n', '<c-a><c-u>', 'yypVr=<c-l>', opts)
map('n', '<c-a><c-d>', 'o<esc>60i-<esc>', opts)

function append_to_line(text)
    -- Get the current buffer and cursor position
    local buf = vim.api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local current_line = vim.api.nvim_buf_get_lines(buf, cursor_pos[1] - 1, cursor_pos[1], false)[1]
    local new_line = current_line .. text
    vim.api.nvim_buf_set_lines(buf, cursor_pos[1] - 1, cursor_pos[1], false, { new_line })
    vim.api.nvim_win_set_cursor(0, { cursor_pos[1], #new_line })
end

function append_date()
    append_to_line(os.date("%Y-%m-%d"))
end

map('n', '<c-n><c-n>', ':cd ' .. vim.g.wiki_location .. '<CR>:VimwikiIndex<CR>', opts)
map('n', '<c-n><c-s>', ':!note-sync<CR>', opts)
map('n', '<c-a><c-d>', ':lua append_date()<CR>', opts)
