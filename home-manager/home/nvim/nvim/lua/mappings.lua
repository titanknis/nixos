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
map('n', '<leader>bd', ':bd<CR>', opts)


map('n', '<C-a>', 'ggVG', opts)  -- Select all text
map('n', '<leader>a', 'ggVG', opts)  -- Select all text
map('n', '<leader>y', '"+y', opts)  -- Yank to system clipboard
map('n', '<leader>p', '"+p', opts)  -- Paste from system clipboard

-- Plugin key mappings
map('n', '<leader>t', ':NvimTreeFocus<CR>', opts)
map('n', '<leader>u', ':UndotreeToggle<CR>',  opts)

map('n', '<leader>gs', ':Git<CR>', opts)
map('n', '<leader>ga', ':Git add %<CR>', opts)

-- Telescope Keybindings
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- C/C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
  vim.keymap.set("n", "<C-CR>", ":update | below split | term clang -g % -o %:r && ./%:r<CR>:startinsert<CR>", { buffer = true })
  end,
})

-- Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.keymap.set("n", "<C-CR>", ":update | below split | term python %<CR>:startinsert<CR>", { buffer = true })
  end,
}) 
