-- telescope.lua

---@module 'lazy'
---@type LazySpec
return {

	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			"kristijanhusak/vim-dadbod-completion",
			"tpope/vim-dadbod",
		},
		event = "VeryLazy",
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		keys = {
			{ "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
		},
		-- init = function()
		-- 	vim.g.db_ui_auto_execute_table_helpers = 1
		-- end,
	},

	{
		"tpope/vim-dadbod",
		event = "VeryLazy",
		cmd = { "DB" },
	},
}
