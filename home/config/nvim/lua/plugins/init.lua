-- plugins/init.lua

-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Define your plugin specifications
local plugins = {
	require("plugins.alpha"),
	require("plugins.treesitter"),
	require("plugins.nvim-tree"),
	require("plugins.pomo"),
	require("plugins.obsidian"),
	require("plugins.conform"),
	require("plugins.lsp"),
	require("plugins.cmp"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.tokyonight"),
	require("plugins.telescope"),
	require("plugins.gitsigns"),
	require("plugins.fugitive"),
	require("plugins.toggleterm"),
	require("plugins.vim-surround"),
	require("plugins.nvim-dap"),
	require("plugins.leetcode"),
	require("plugins.competitest"),

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{ "mbbill/undotree" },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}

-- Set up lazy.nvim with your plugin specifications
require("lazy").setup(plugins)
