-- leetcode.lua
return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
	dependencies = {
		"nvim-telescope/telescope.nvim",
		-- "ibhagwan/fzf-lua",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("leetcode").setup({
			lang = "cpp",
			storage = { home = "~/Dev/Problem_Solving/leetcode/" },
			browser = "firefox", -- Browser for opening problems

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
			-- other options here
		})
	end,
	opts = {
		-- configuration goes here
	},
}
