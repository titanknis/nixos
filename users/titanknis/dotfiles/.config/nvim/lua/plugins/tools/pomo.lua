-- pomo.lua
return {
	"epwalsh/pomo.nvim",
	version = "*", -- Recommended, use latest release instead of latest commit
	lazy = true,
	cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
	dependencies = {
		"rcarriga/nvim-notify", -- Optional, but recommended
	},
	config = function()
		-- Setup Pomo
		require("pomo").setup({
			sessions = {
				pomodoro = {
					{ name = "Work", duration = "25m" },
					{ name = "Short Break", duration = "5m" },
					{ name = "Work", duration = "25m" },
					{ name = "Short Break", duration = "5m" },
					{ name = "Work", duration = "25m" },
					{ name = "Long Break", duration = "15m" },
				},
			},
		})

		-- Load the Telescope extension
		require("telescope").load_extension("pomodori")

		-- Keymap to manage timers
		vim.keymap.set("n", "<leader>ft", function()
			require("telescope").extensions.pomodori.timers()
		end, { desc = "Manage Pomodori Timers" })
	end,
}
