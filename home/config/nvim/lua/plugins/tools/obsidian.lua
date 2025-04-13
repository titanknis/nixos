-- obsidian.lua
return {
	"epwalsh/obsidian.nvim",
	version = "*",
	ft = "markdown",
	cmd = { "ObsidianNew", "ObsidianSearch", "ObsidianQuickSwitch", "ObsidianToday", "ObsidianDailies" }, -- Add the commands you want to trigger plugin loading
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp", -- Recommended for completion
		"nvim-telescope/telescope.nvim", -- Recommended for search
	},
	config = function()
		-- Set up the plugin
		require("obsidian").setup({
			workspaces = {
				{
					name = "notes",
					path = "~/Learning/notes", -- Your Obsidian vault path
				},
			},
			daily_notes = {
				folder = "Daily", -- Folder for daily notes
				date_format = "%Y-%m-%d", -- Date format for daily notes
				template = "Daily.md", -- Optional daily note template
			},
			templates = {
				folder = "Templates",
				substitutions = {
					yesterday = function()
						return os.date("%Y-%m-%d", os.time() - 86400)
					end,
					-- Add other unique project-specific substitutions here if needed
				},
			},
			completion = {
				nvim_cmp = true, -- Enable nvim-cmp completion
			},
			notes_subdir = "Inbox", -- Subdirectory for new notes
			new_notes_location = "notes_subdir", -- Where to place new notes
		})

		-- Optionally, hide markdown syntax in Obsidian notes
		vim.opt.conceallevel = 2
	end,
}
