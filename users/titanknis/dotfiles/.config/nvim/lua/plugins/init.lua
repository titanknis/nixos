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
	require("plugins.core.blink"),
	require("plugins.core.conform"),
	require("plugins.core.treesitter"),
	require("plugins.core.lsp"),
	require("plugins.core.neotest"),
	require("plugins.toTweak.dap"),
	-- require("plugins.toTweak.mason"),

	require("plugins.toTweak.jdtls"),

	-- UI
	require("plugins.ui.lualine"),
	require("plugins.ui.gruvebox"), -- active colortheme

	-- Tools
	require("plugins.tools.oil"),
	require("plugins.tools.telescope"),
	require("plugins.tools.which-key"),
	require("plugins.tools.dadbod"),
	require("plugins.tools.toggleterm"),
	require("plugins.tools.flutter"),
	-- require("plugins.toTweak.iron"),

	-- Git
	require("plugins.git.gitsigns"),
	require("plugins.git.fugitive"),

	-- Extra
	require("plugins.extra.mini"),
	require("plugins.extra.todo"),
	require("plugins.extra.colorizer"),
	require("plugins.extra.diagram"),
	-- require("plugins.extra.vimtex"),

	-- Competitive Programming
	-- require("plugins.cp.competitest"),
	-- require("plugins.cp.leetcode"),
}

-- Set up lazy.nvim with your plugin specifications
require("lazy").setup(plugins)
