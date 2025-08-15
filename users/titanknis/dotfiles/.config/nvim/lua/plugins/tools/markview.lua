-- For `plugins/markview.lua` users.

-- return {
-- 	"OXY2DEV/markview.nvim",
-- 	lazy = false,
-- 	priority = 49, -- ensure it loads first
--
-- 	-- For blink.cmp's completion
-- 	-- source
-- 	-- dependencies = {
-- 	--     "saghen/blink.cmp"
-- 	-- },
-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
-- }

-- For `plugins/markview.lua` users.
return {
	"OXY2DEV/markview.nvim",
	lazy = false,

	-- For `nvim-treesitter` users.
	priority = 49,

	-- For blink.cmp's completion
	-- source
	-- dependencies = {
	--     "saghen/blink.cmp"
	-- },
}
-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	dependencies = { "OXY2DEV/markview.nvim" },
-- 	lazy = false,
--
-- 	-- ... All other options.
-- }
