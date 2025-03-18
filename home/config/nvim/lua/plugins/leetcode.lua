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
			storage = { home = "~/leetcode/" },
			browser = "firefox", -- Browser for opening problems
			-- other options here
		})
	end,
	opts = {
		-- configuration goes here
	},
}
