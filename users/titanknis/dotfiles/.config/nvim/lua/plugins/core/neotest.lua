return {
	{
		"nvim-neotest/neotest-python",
		ft = "python",
		dependencies = {},
	},
	{
		"rcasia/neotest-java",
		ft = "java",
		dependencies = {
			"mfussenegger/nvim-jdtls",
			"mfussenegger/nvim-dap", -- for the debugger
			"rcarriga/nvim-dap-ui", -- recommended
			"theHamsta/nvim-dap-virtual-text", -- recommended
		},
	},

	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",

			"nvim-neotest/neotest-python",
			"rcasia/neotest-java",
			"sidlatau/neotest-dart",
		},
		cmd = "Neotest", -- Lazy load on :Neotest command
		event = "VeryLazy",
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						-- dap = { justMyCode = false },
					}),
					require("neotest-java")({
						-- config here
						-- test_classname_patterns = { "^.*Tests.*", "^.*IT$", "^.*Spec$" },
					}),
					require("neotest-dart")({
						command = "flutter",
						use_lsp = true,
					}),
				},
			})
		end,
		keys = {
			{ "<leader>tr", "<cmd>Neotest run<cr>", desc = "Run nearest test" },
			{ "<leader>tf", "<cmd>Neotest run file<cr>", desc = "Run file tests" },
			{ "<leader>ts", "<cmd>Neotest summary<cr>", desc = "Test summary" },
			{ "<leader>to", "<cmd>Neotest output<cr>", desc = "Test output" },
			{ "<leader>ta", "<cmd>Neotest attach<cr>", desc = "Attach to running test" },
		},
	},
}
