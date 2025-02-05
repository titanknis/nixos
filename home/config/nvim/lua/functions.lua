-- functions.lua
function RunCode()
	-- Get file info
	local filetype = vim.bo.filetype
	local file = vim.fn.expand("%:t") -- Just the filename
	local outfile = vim.fn.expand("%:t:r") -- Filename without extension
	local dir = vim.fn.expand("%:p:h") -- Directory of current file

	local commands = {
		python = string.format("cd %s && python %s", dir, file),
		c = string.format("cd %s && clang %s -o %s && ./%s", dir, file, outfile, outfile),
		cpp = string.format("cd %s && clang++ %s -o %s && ./%s", dir, file, outfile, outfile),
		java = string.format("cd %s && javac %s && java %s", dir, file, outfile),
	}

	local cmd = commands[filetype]
	if cmd then
		vim.cmd("update") -- Save the file before running
		require("toggleterm").exec(cmd)
		vim.cmd("wincmd j") -- Move to terminal window
	else
		-- print("Filetype not supported")
		vim.notify("Filetype not supported for running", vim.log.levels.WARN)
	end
end

function toggleColorScheme()
	-- Get current colorscheme
	local current = vim.g.colors_name

	-- Check if required colorschemes are available
	local has_catppuccin = pcall(require, "catppuccin")
	local has_tokyonight = pcall(require, "tokyonight")

	if not (has_catppuccin and has_tokyonight) then
		vim.notify(
			"Missing required colorschemes. Please install both catppuccin and tokyonight.",
			vim.log.levels.ERROR
		)
		return
	end

	-- Toggle between schemes
	if current == "tokyonight-moon" then
		-- Switch to Catppuccin
		vim.cmd("colorscheme catppuccin")
		vim.notify("Switched to Catppuccin theme")
	else
		-- Switch to Tokyo Night
		vim.cmd("colorscheme tokyonight")
		vim.notify("Switched to Tokyo Night theme")
	end
end
