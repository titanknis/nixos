-- leetcode.lua
return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>L", "<cmd>Leet<cr>", desc = "Leet list" },
		{ "<leader>ll", "<cmd>Leet list<cr>", desc = "Leet list" },
		{ "<leader>ld", "<cmd>Leet desc<cr>", desc = "Leet desc" },
		{ "<leader>lr", "<cmd>Leet run<cr>", desc = "Leet run" },
		{ "<leader>ls", "<cmd>Leet submit<cr>", desc = "Leet submit" },
		{ "<leader>lt", "<cmd>Leet tabs<cr>", desc = "Leet tabs" },
		{ "<leader>ly", "<cmd>Leet yank<cr>", desc = "Leet yank" },
		{ "<leader>lo", "<cmd>Leet open<cr>", desc = "Leet open" },
		{ "<leader>li", "<cmd>Leet inject<cr>", desc = "Leet inject" },
		{ "<leader>lc", "<cmd>Leet console<cr>", desc = "Leet console" },
	},

	-- -- Leetcode keymaps
	-- { "<leader>lt", "<cmd>Leet tabs<cr>",    desc = "Leet tabs" },
	-- { "<leader>ly", "<cmd>Leet yank<cr>",    desc = "Leet yank" },
	-- { "<leader>lo", "<cmd>Leet open<cr>",    desc = "Leet open" },
	-- { "<leader>li", "<cmd>Leet inject<cr>",  desc = "Leet inject" },
	-- { "<leader>lc", "<cmd>Leet console<cr>", desc = "Leet console" },
	config = function()
		require("leetcode").setup({
			lang = "cpp",
			storage = { home = "~/Dev/Problem_Solving/leetcode/" },
			browser = "firefox",
			injector = {
				["cpp"] = {
					before = { "#include <bits/stdc++.h>", "using namespace std;" },
					after = {
						"int main() {",
						"   ios::sync_with_stdio(false);",
						"   cin.tie(nullptr);",
						"   Solution sol;",
						"   //cout << sol.methodName(args);",
						"   return 0;",
						"}",
					},
				},
			},
		})
	end,
}
