-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("nvim-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

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
