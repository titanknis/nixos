-- tokyonight.lua
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		-- Set colorscheme to tokyonight-night
		vim.cmd("colorscheme tokyonight")
	end,
}
