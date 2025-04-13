-- plugins/init.lua

-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Define your plugin specifications
local plugins = {

	-- Core
	require("plugins.core.cmp"),
	require("plugins.core.luasnip"),
	require("plugins.core.conform"),
	require("plugins.core.lsp"),
	require("plugins.core.nvim-dap"),
	require("plugins.core.treesitter"),

	-- UI
	require("plugins.ui.alpha"),
	require("plugins.ui.bufferline"),
	require("plugins.ui.lualine"),

	-- Colors
	require("plugins.colors.nightfox"),
	require("plugins.colors.rosepine"),
	require("plugins.colors.catppuccin"),
	require("plugins.colors.gruvebox"),
	require("plugins.colors.tokyonight"), --active: -- after testing both i liked tokyonight more than rosepine

	-- Tools
	require("plugins.tools.nvim-tree"),
	require("plugins.tools.obsidian"),
	require("plugins.tools.pomo"),
	require("plugins.tools.telescope"),
	require("plugins.tools.toggleterm"),
	require("plugins.tools.vim-surround"),

	-- Git
	require("plugins.git.fugitive"),
	require("plugins.git.gitsigns"),

	-- Competitive Programming
	require("plugins.cp.competitest"),
	require("plugins.cp.leetcode"),

	-- Misc
	require("plugins.misc.autopair"),
	require("plugins.misc.comments"),
	require("plugins.misc.indent"),
	require("plugins.misc.todo"),
	require("plugins.misc.undotree"),
}

-- Set up lazy.nvim with your plugin specifications
require("lazy").setup(plugins)
