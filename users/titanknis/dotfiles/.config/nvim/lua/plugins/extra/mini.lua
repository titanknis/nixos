-- mini.lua
return {
	"nvim-mini/mini.nvim",
	lazy = false,
	config = function()
		require("mini.pairs").setup()
		require("mini.comment").setup()
		require("mini.surround").setup()
		require("mini.indentscope").setup({
			symbol = "│",
			draw = { animation = require("mini.indentscope").gen_animation.none() },
		})
	end,
}
