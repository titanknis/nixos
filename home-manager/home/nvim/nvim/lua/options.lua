-- settings.lua

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- General settings
vim.o.belloff = "all" -- Disable bell
vim.o.clipboard = "unnamedplus" -- Use system clipboard

vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers

vim.o.shiftwidth = 4 -- Spaces per indent level
vim.o.tabstop = 4 -- Spaces per tab
vim.o.expandtab = true -- Use spaces instead of tabs
vim.opt.wrap = false -- Don't wrap lines

vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Don't ignore case with capitals

vim.o.mouse = "a" -- Enable mouse support
vim.opt.termguicolors = true -- True color support (24-bit color)
vim.opt.cursorline = true -- Highlight current line
vim.g.have_nerd_font = true

-- Neovim folding settings
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99 -- Open all folds by default

vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
