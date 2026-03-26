-- competitest.lua
return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>cc", "<cmd>CompetiTest receive contest<cr>", desc = "Receive contest" },
		{ "<leader>cp", "<cmd>CompetiTest receive problem<cr>", desc = "Receive problem" },
		{ "<leader>ct", "<cmd>CompetiTest receive testcases<cr>", desc = "Receive testcases" },
		{ "<leader>cS", "<cmd>CompetiTest receive stop<cr>", desc = "Stop receiving" },
		{ "<leader>ca", "<cmd>CompetiTest add_testcase<cr>", desc = "Add testcase" },
		{ "<leader>ce", "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit testcase" },
		{ "<leader>cd", "<cmd>CompetiTest delete_testcase<cr>", desc = "Delete testcase" },
		{ "<leader>cr", "<cmd>CompetiTest run<cr>", desc = "Run" },
		{ "<leader>cs", "<cmd>CompetiTest show_ui<cr>", desc = "Show UI" },
	},
	config = function()
		require("competitest").setup({
			compile_command = {
				cpp = {
					exec = "g++",
					args = {
						"-std=c++20",
						"-O2",
						"-Wall",
						"-Wextra",
						"-Wshadow",
						"-Wconversion",
						"-Wno-sign-conversion",
						"-Wpedantic",
						"-Wfloat-equal",
						"-DLOCAL",
						"-g",
						"-fsanitize=address,undefined",
						"$(FNAME)",
						"-o",
						"$(FNOEXT)",
					},
				},
			},
			testcases_directory = "tests",
			evaluate_template_modifiers = true,
			template_file = {
				cpp = "~/.config/nvim/templates/template.cpp",
				py = "~/.config/nvim/templates/template.py",
			},
			received_problems_path = "$(HOME)/Dev/Problem_Solving/$(JUDGE)/problems/$(PROBLEM).$(FEXT)",
			received_contests_directory = "$(HOME)/Dev/Problem_Solving/$(JUDGE)/contests/$(CONTEST)",
		})
	end,
}
