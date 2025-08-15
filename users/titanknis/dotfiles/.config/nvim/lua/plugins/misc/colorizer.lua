return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		-- Attaches to every FileType mode
		require("colorizer").setup()
	end,
}
