-- diagram.lua
return {
	{
		"3rd/image.nvim",
		build = false,
		opts = {
			-- backend = "kitty", -- or "ueberzug" or "sixel"
			-- processor = "magick_cli", -- or "magick_rock"
			-- integrations = {
			-- 	markdown = {
			-- 		enabled = false,
			-- 		clear_in_insert_mode = false,
			-- 		download_remote_images = true,
			-- 		only_render_image_at_cursor = false,
			-- 		filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
			--
			-- 		-- only_render_image_at_cursor = true, -- cleaner
			-- 		-- only_render_image_at_cursor_mode = "popup",
			-- 	},
			-- },
			-- max_width = nil,
			-- max_height = nil,
			-- max_width_window_percentage = nil,
			-- max_height_window_percentage = 50,
			-- kitty_method = "normal",
		},
	},
	{
		"3rd/diagram.nvim",
		dependencies = {
			"3rd/image.nvim",
		},
		opts = {
			-- Disable automatic rendering for manual-only workflow
			events = {
				-- render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
				-- render_buffer = {}, -- Empty = no automatic rendering
				clear_buffer = { "BufLeave" },
			},
			renderer_options = {
				mermaid = {
					theme = "dark",
					-- scale = 2,
				},
			},
		},
		-- keys = {
		-- 	{
		-- 		"K", -- or any key you prefer
		-- 		function()
		-- 			require("diagram").show_diagram_hover()
		-- 		end,
		-- 		mode = "n",
		-- 		ft = { "markdown", "norg" }, -- Only in these filetypes
		-- 		desc = "Show diagram in new tab",
		-- 	},
		-- },
	},
}
