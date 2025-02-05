-- nvim-tree.lua
return {
	"nvim-tree/nvim-tree.lua", -- Nvim Tree for file navigation
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({ filters = { dotfiles = true } })
	end,
}
