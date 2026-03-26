-- lualine.lua
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename", file_status = true, path = 1 }, -- File name with icon
					"filetype", -- Filetype with icon
				},
			},
		})
	end,
}
