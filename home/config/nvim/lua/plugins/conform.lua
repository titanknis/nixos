-- conform.lua
return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				python = { "black" },
				java = { "google-java-format" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				nix = { "alejandra" },
				lua = { "stylua" },
				markdown = { "prettier" },
			},
		})
	end,
}
