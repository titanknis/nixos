-- toggleterm.lua
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	opts = {
		open_mapping = [[<C-;>]], -- global toggle for terminal #1
		terminal_mappings = true, -- open_mapping works inside terminal too
	},
	keys = {
		{ "<leader><Esc>", [[<C-\><C-n>]], mode = "t", desc = "Exit terminal mode" },

		{ "<leader>t1", "<cmd>1ToggleTerm<cr>", mode = { "n", "t" }, desc = "Terminal 1" },
		{ "<leader>t2", "<cmd>2ToggleTerm<cr>", mode = { "n", "t" }, desc = "Terminal 2" },
		{ "<leader>t3", "<cmd>3ToggleTerm<cr>", mode = { "n", "t" }, desc = "Terminal 3" },
	},
}
