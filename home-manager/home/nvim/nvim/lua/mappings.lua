
-- mappings.lua

-- Define mapleader
vim.g.mapleader = " "

-- Define key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>n', ':set relativenumber!<CR>', opts)
map('n', '<leader>q', ':q!<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>x', ':x<CR>', opts)
map('n', '<leader>y', '"+y', opts)  -- Yank to system clipboard
map('n', '<leader>p', '"+p', opts)  -- Paste from system clipboard

-- Plugin-specific mappings
map('n', '<leader>t', ':NERDTreeToggle<CR>', opts)
