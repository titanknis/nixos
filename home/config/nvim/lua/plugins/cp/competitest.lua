-- competitest.lua
return {
	"xeluxee/competitest.nvim",
	-- commit = "e397635d212605a3fa0e2d06f3e6209085189e3f",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		require("competitest").setup({ -- to customize settings
			compile_command = {
				cpp = {
					exec = "g++",
					args = {
						"-std=c++20",
						"-O2",

						"-Wall", -- Enable all basic warnings (codeforces uses)
						"-Wextra", -- Extra warnings (codeforces uses)
						"-Wshadow", -- Warn if a variable name shadows another
						"-Wconversion", -- Warn on implicit type conversions (codeforces uses)
						"-Wno-sign-conversion", -- Avoid noise from signed/unsigned conversions.
						"-Wpedantic", -- warns about non-standard C++ language extensions.

						"-Wfloat-equal",

						"-DLOCAL", -- Enable local debugging (declares LOCAL)
						"-g",
						"-fsanitize=address,undefined",
						"$(FNAME)",
						"-o",
						"$(FNOEXT)",
					},
				},
			},

			-- put here configuration
			testcases_directory = "tests",
			-- testcases_use_single_file = false,

			evaluate_template_modifiers = true,

			-- template_file = "~/.config/nvim/templates/template.$(FEXT)",
			template_file = {
				cpp = "~/.config/nvim/templates/template.cpp",
				py = "~/.config/nvim/templates/template.py",
			},

			received_problems_path = "$(HOME)/Dev/Problem_Solving/$(JUDGE)/problems/$(PROBLEM).$(FEXT)",
			received_contests_directory = "$(HOME)/Dev/Problem_Solving/$(JUDGE)/contests/$(CONTEST)",
		})
	end,
}
