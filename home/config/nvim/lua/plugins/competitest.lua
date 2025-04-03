-- competitest.lua
return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		require("competitest").setup({ -- to customize settings
			-- put here configuration
			testcases_directory = "tests",
			-- testcases_use_single_file = false,

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
