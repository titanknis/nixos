-- toggleterm.lua
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {--[[ things you want to change go here]]
	},
	config = function()
		require("toggleterm").setup({
			-- Use <leader>; to toggle the terminal in normal mode
			-- vim.keymap.set("n", "<SPACE>;", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" }),
			open_mapping = [[<C-;>]], -- Toggle terminal with Ctrl+\ (can be customized)
			-- direction = "float", -- Floating terminal for easy visibility
		})
	end,
}
