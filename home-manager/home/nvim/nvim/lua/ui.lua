require("bufferline").setup({})

-- Nvim-tree setup
require("nvim-tree").setup({ filters = { dotfiles = true } })

-- Lualine setup
require("lualine").setup({
	options = { theme = "tokyonight" },
	sections = {
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{ "filename", file_status = true, path = 1 }, -- File name with icon
			"filetype", -- Filetype with icon
		},
	},
})
