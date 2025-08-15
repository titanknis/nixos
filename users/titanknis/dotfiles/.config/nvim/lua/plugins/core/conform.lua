-- conform.lua
return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },

				go = { "gofmt" },
				java = { "google-java-format" },

				python = { "black" },
				sh = { "shfmt" },

				lua = { "stylua" },
				nix = { "nixfmt" },

				markdown = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
			},
		})
	end,
}
