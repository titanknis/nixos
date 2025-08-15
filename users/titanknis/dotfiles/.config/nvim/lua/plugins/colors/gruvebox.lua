return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	opts = {},

	config = function()
		-- Set colorscheme to gruvbox %%
		-- vim.o.background = "dark" -- or "light" for light mode
		-- vim.cmd("set background=light")
		vim.cmd("colorscheme gruvbox")
	end,
}
