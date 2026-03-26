-- conform.lua
return {
	"stevearc/conform.nvim",

	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		format_on_save = { timeout_ms = 500 },
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

			dart = { "dart_format" },
		},
	},
	keys = {
		{
			"<leader>fd",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format buffer",
		},
	},
}
