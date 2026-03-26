-- gitsigns.lua
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview git hunk" },
	},
	opts = {},
}
