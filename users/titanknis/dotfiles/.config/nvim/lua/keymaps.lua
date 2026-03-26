-- mappings.lua

vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- General
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true, desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>a", "ggVG", { noremap = true, silent = true, desc = "Select all" })
vim.keymap.set("n", "<leader>n", ":set relativenumber!<CR>", { desc = "Toggle relative numbers" })
vim.keymap.set("n", "<leader>q", ":q!<CR>", { noremap = true, silent = true, desc = "Quit without saving" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save" })

-- Buffers
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true, desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<A-1>", "<Cmd>buffer 1<CR>", { noremap = true, silent = true, desc = "Go to buffer 1" })
vim.keymap.set("n", "<A-2>", "<Cmd>buffer 2<CR>", { noremap = true, silent = true, desc = "Go to buffer 2" })
vim.keymap.set("n", "<A-3>", "<Cmd>buffer 3<CR>", { noremap = true, silent = true, desc = "Go to buffer 3" })
vim.keymap.set("n", "<A-4>", "<Cmd>buffer 4<CR>", { noremap = true, silent = true, desc = "Go to buffer 4" })
vim.keymap.set("n", "<A-4>", "<Cmd>buffer 4<CR>", { noremap = true, silent = true, desc = "Go to buffer 4" })
-- ... and so on

-- Custom functions
-- Map Ctrl+enter to run code
vim.keymap.set("n", "<C-CR>", "<cmd>lua RunCode()<CR>", { noremap = true, silent = true, desc = "Run Code" })
-- vim.keymap.set(
-- 	{ "n", "t" },
-- 	"<C-;>",
-- 	"<cmd>lua TermToggle()<CR>",
-- 	{ noremap = true, silent = true, desc = "Toggle terminal" }
-- )
