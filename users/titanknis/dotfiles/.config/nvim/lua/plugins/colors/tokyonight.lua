-- tokyonight.lua
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		-- Set colorscheme to tokyonight-night
		-- vim.o.background = "light" -- or "light" for light mode
		-- vim.cmd("colorscheme tokyonight")
	end,
}
