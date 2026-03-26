return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			-- Install specific parsers
			require("nvim-treesitter").install({
				"c",
				"cpp",
				"java",
				"python",
				"nix",
				"sql",
				"lua",
				"html",
				"javascript",
				"css",
				"latex",
				"markdown",
				"markdown_inline",
				"vim",
				"hyprlang",
				"dart",
			})
		end,
	},
	{
		"MeanderingProgrammer/treesitter-modules.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			highlight = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-n>",
					node_incremental = "<C-n>",
					scope_incremental = "<C-s>",
					node_decremental = "<C-m>",
				},
			},
		},
	},
}
