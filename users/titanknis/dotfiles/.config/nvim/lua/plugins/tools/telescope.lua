-- telescope.lua
-- NOTE: look more into telescope it looks interesting(git commit picker and more)
-- NOTE: brenoprata10/nvim-highlight-colors is an ALTERNATIVE

---@module 'lazy'
---@type LazySpec
return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		-- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fa", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find files (include hidden)" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help tags" },
	},
}
