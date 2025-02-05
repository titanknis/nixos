-- mappings.lua

-- Define mapleader
vim.g.mapleader = " "

-- Define key mappings
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>rl", ":source $MYVIMRC<CR>", { desc = "Reload config" })
vim.keymap.set("n", "<leader>n", ":set relativenumber!<CR>", opts)
vim.keymap.set("n", "<leader>q", ":q!<CR>", opts)
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<leader>x", ":x<CR>", opts)

vim.keymap.set("n", "<C-a>", "ggVG", opts) -- Select all text
vim.keymap.set("n", "<leader>a", "ggVG", opts) -- Select all text
vim.keymap.set("n", "<leader>y", '"+y', opts) -- Yank to system clipboard
vim.keymap.set("n", "<leader>p", '"+p', opts) -- Paste from system clipboard

-- buffer navigation
vim.keymap.set("n", "<leader>bd", ":bd<CR>", opts)
vim.keymap.set("n", "<leader>bn", ":bnext<cr>", opts)
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", opts)

-- Plugin key mappings
vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>", opts)
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", opts)

vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", opts)
-- Format document
vim.keymap.set("n", "<leader>fd", function()
	require("conform").format({ async = true })
end, { desc = "Format Code" })

-- Telescope Keybindings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Hidden file operations
vim.keymap.set("n", "<leader>fh", function()
	builtin.find_files({ hidden = true })
end, { desc = "Telescope find hidden files" })

-- Obsidian keymaps
vim.keymap.set("n", "<leader>fn", ":ObsidianQuickSwitch<CR>")

vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>")
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>")
vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<CR>")
vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>")
vim.keymap.set("n", "<leader>od", ":ObsidianDailies<CR>")
vim.keymap.set("n", "<leader>oit", ":ObsidianTemplate<CR>")

vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>")
vim.keymap.set("n", "<leader>ol", ":ObsidianLinks<CR>", { desc = "Show Note Links" })
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>") -- Show backlinks

-- Pomo keymaps
vim.keymap.set("n", "<leader>tm", ":TimerStart ")
vim.keymap.set("n", "<leader>tr", ":TimerRepeat ")
vim.keymap.set("n", "<leader>tp", ":TimerSession pomodoro<CR>")
vim.keymap.set("n", "<leader>tP", ":TimerPause<CR>")
vim.keymap.set("n", "<leader>tR", ":TimerResume<CR>")
vim.keymap.set("n", "<leader>ts", ":TimerStop<CR>")
vim.keymap.set("n", "<leader>th", ":TimerHide<CR>")
vim.keymap.set("n", "<leader>tw", ":TimerShow<CR>")

-- Custom functions

-- Map Ctrl+enter to run code
vim.keymap.set("n", "<C-CR>", "<cmd>lua RunCode()<CR>", opts)
-- toggle Color Scheme
vim.keymap.set("n", "<leader>tc", "<cmd>lua toggleColorScheme()<CR>", opts)
