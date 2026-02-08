-- sqls.lua
return {
	"nanotee/sqls.nvim",

	config = function()
		vim.lsp.config("sqls", {
			-- 	-- your custom client configuration
			-- 	settings = {
			-- 		sqls = {
			-- 			connections = {
			-- 				{
			-- 					driver = "postgresql",
			-- 					dataSourceName = "user=youruser password=yourpass host=localhost port=5432 dbname=yourdb sslmode=disable",
			-- 				},
			-- 			},
			-- 		},
			-- 	},
		})
		vim.lsp.enable("sqls")
	end,
}
