-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("nvim-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- Format file on Save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
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
