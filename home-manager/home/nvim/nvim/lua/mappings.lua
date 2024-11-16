-- mappings.lua

-- Define mapleader
vim.g.mapleader = " "

-- Define key mappings
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>n", ":set relativenumber!<CR>", opts)
vim.keymap.set("n", "<leader>q", ":q!<CR>", opts)
vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<leader>x", ":x<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bd<CR>", opts)

vim.keymap.set("n", "<C-a>", "ggVG", opts) -- Select all text
vim.keymap.set("n", "<leader>a", "ggVG", opts) -- Select all text
vim.keymap.set("n", "<leader>y", '"+y', opts) -- Yank to system clipboard
vim.keymap.set("n", "<leader>p", '"+p', opts) -- Paste from system clipboard

-- Plugin key mappings
vim.keymap.set("n", "<leader>t", ":NvimTreeFocus<CR>", opts)
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", opts)
-- Format document
vim.keymap.set("n", "<leader>fd", function()
	require("conform").format({ async = true })
end, { desc = "Format Code" })

--map('n', '<leader>gs', ':Git<CR>', opts)
--map('n', '<leader>ga', ':Git add %<CR>', opts)

-- Telescope Keybindings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Python run
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		vim.keymap.set("n", "<C-CR>", function()
			vim.cmd("update | below split | term python %")
			vim.cmd("startinsert")
		end, { buffer = true })
	end,
}) -- C/C++ compile and run
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		vim.keymap.set("n", "<C-CR>", function()
			vim.cmd("update | below split | term clang -g % -o %:r && ./%:r")
			vim.cmd("startinsert")
		end, { buffer = true })
	end,
})
-- Java compile and run
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "java" },
	callback = function()
		vim.keymap.set("n", "<C-CR>", function()
			vim.cmd("update | below split | term javac % && java %:r")
			vim.cmd("startinsert")
		end, { buffer = true })
	end,
})
-- Markdown preview
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.keymap.set("n", "<leader>gw", ":Glow<CR>", { buffer = true }) -- Trigger Glow preview in a floating window
		vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { buffer = true, desc = "Preview markdown" })
		vim.keymap.set(
			"n",
			"<leader>ms",
			"<cmd>MarkdownPreviewStop<CR>",
			{ buffer = true, desc = "Stop markdown preview" }
		)
		vim.keymap.set(
			"n",
			"<leader>mt",
			"<cmd>MarkdownPreviewToggle<CR>",
			{ buffer = true, desc = "Toggle markdown preview" }
		)
	end,
})
