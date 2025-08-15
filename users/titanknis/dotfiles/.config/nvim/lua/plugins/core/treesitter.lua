-- treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"cpp",
				"java",
				"python",
				"nix",
				"lua",
				"html",
				"markdown",
				"markdown_inline",
				"vim",
				"hyprlang",
			}, -- Install parsers
			auto_install = true, -- Automatically install missing parsers when entering buffer

			highlight = { enable = true, additional_vim_regex_highlighting = false }, -- Enable syntax highlighting -- Disable regex-based additional_vim_regex_highlighting
			--indent = { enable = true, },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-n>",
					node_incremental = "<C-n>",
					scope_incremental = "<C-s>",
					node_decremental = "<C-m>",
				},
			},
		})
	end,
} -- Syntax highlighting
