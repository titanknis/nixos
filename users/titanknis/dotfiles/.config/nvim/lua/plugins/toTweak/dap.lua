-- plugins/nvim-dap.lua

---@module 'lazy
---@type LazySpec
return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"igorlfs/nvim-dap-view", -- NOTE: seem to be better. i will try both before judging. Alternative UI :nvim-dap-ui"
			"mfussenegger/nvim-dap-python",
		},
		cmd = { "DapContinue", "DapToggleBreakpoint", "DapStepOver", "DapStepInto", "DapStepOut" },
		keys = {
			{ "<F5>", "<cmd>DapContinue<cr>", desc = "DAP Continue" },
			{ "<F9>", "<cmd>DapRestartFrame<cr>", desc = "DAP Restart Frame" },
			{ "<F10>", "<cmd>DapStepOver<cr>", desc = "DAP Step Over" },
			{ "<F11>", "<cmd>DapStepInto<cr>", desc = "DAP Step Into" },
			{ "<F12>", "<cmd>DapStepOut<cr>", desc = "DAP Step Out" },
			{ "<leader>dq", "<cmd>DapTerminate<cr>", desc = "DAP Terminate" },
			{ "<leader>dB", "<cmd>DapToggleBreakpoint<cr>", desc = "DAP Breakpoint Toggle" },
		},

		config = function()
			require("dap-python").setup(vim.fn.exepath("python3"))
		end,
	},
	{
		"igorlfs/nvim-dap-view",
		event = "VeryLazy",
		opts = {
			auto_toggle = true,
		},
		keys = {
			{ "<leader>dv", "<cmd>DapViewToggle!<cr>", desc = "DAP View Toggle" },
		},
	},
}
