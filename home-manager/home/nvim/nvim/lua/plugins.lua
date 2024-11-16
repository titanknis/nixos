-- plugins.lua

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
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } }, -- Fuzzy finder
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Syntax highlighting
	{ "tpope/vim-fugitive" }, -- Git integration
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} }, -- Tokyo Night theme with configuration
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }, -- Status line with icons support
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "windwp/nvim-autopairs" },
	{
		"nvim-tree/nvim-tree.lua", -- Nvim Tree for file navigation
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",

		opts = {},
	},
	{ "mbbill/undotree" },

	{ "williamboman/mason.nvim" },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},

	-- Autocompletion plugins
	{ "hrsh7th/nvim-cmp" }, -- Completion engine
	{ "hrsh7th/cmp-buffer" }, -- Buffer completions
	{ "hrsh7th/cmp-path" }, -- Path completions
	{ "hrsh7th/cmp-cmdline" }, -- Command line completions
	{ "hrsh7th/cmp-nvim-lsp" }, -- LSP completions
	{ "saadparwaiz1/cmp_luasnip" }, -- Snippet completions

	-- Snippets
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
}

-- Set up lazy.nvim with your plugin specifications
require("lazy").setup(plugins)

require("conform").setup({
	formatters_by_ft = {
		python = { "black" },
		java = { "google-java-format" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		nix = { "alejandra" },
		lua = { "stylua" },
	},
})
