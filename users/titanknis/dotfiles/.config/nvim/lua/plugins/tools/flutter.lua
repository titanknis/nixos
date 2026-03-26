-- flutter.lua
return {
	"nvim-flutter/flutter-tools.nvim",
	-- lazy = false,
	ft = "dart",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "stevearc/dressing.nvim", -- optional for vim.ui.select
	},

	opts = {
		decorations = {
			statusline = { app_version = false, device = true },
		},
		ui = { border = "rounded" },
		-- color previews rely on the LSP's color provider
		lsp = {
			color = {
				enabled = true, -- this enables inline color squares
				-- background = false,
				-- foreground = false,
				-- virtual_text = true, -- shows the colored square next to the hex
				-- virtual_text_str = "■■■■■■■■■",
			},
		},
	},
	keys = {
		{ "<leader>fr", "<cmd>FlutterRun<cr>", desc = "flutter run" },
		-- { "<leader>fr", "<cmd>FlutterReload<cr>", desc = "flutter reload" }, -- auto reload on write
		{ "<leader>fR", "<cmd>FlutterRestart<cr>", desc = "flutter restart" },
		{ "<leader>fq", "<cmd>FlutterQuit<cr>", desc = "flutter quit" },
		{ "<leader>fD", "<cmd>FlutterDevices<cr>", desc = "flutter devices" },
		{ "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", desc = "flutter Toggle Outline" },
		{ "<leader>fl", "<cmd>FlutterLogToggle<cr>", desc = "flutter Log Toggle" },
		-- { "<leader>fe", "<cmd>FlutterEmulators<cr>", desc = "flutter emulators" },
	},
}
