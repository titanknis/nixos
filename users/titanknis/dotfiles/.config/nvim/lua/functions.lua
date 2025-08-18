-- functions.lua
function RunCode()
	-- Get file info
	local filetype = vim.bo.filetype
	local file = vim.fn.expand("%:t") -- Just the filename
	local outfile = vim.fn.expand("%:t:r") -- Filename without extension
	local dir = vim.fn.expand("%:p:h") -- Directory of current file

	local commands = {
		c = string.format('cd "%s" && clang -pthread "%s" -o "%s" && "./%s"', dir, file, outfile, outfile),
		cpp = string.format('cd "%s" && clang++ "%s" -o "%s" && "./%s"', dir, file, outfile, outfile),
		rust = string.format('cd "%s" && rustc "%s" -o "%s" && "./%s"', dir, file, outfile, outfile),

		go = string.format('cd "%s" && go run "%s"', dir, file),
		java = string.format('cd "%s" && javac "%s" && java "%s"', dir, file, outfile),

		python = string.format('cd "%s" && python "%s"', dir, file),
		sh = string.format('cd "%s" && bash "%s"', dir, file),
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

-- available colorschemes
local colorschemes = {
	-- focus and eye
	"tokyonight",
	-- "tokyonight-moon",
	-- "tokyonight-storm",
	-- "tokyonight-night",
	"gruvbox",
	-- "carbonfox",
	--
	-- "rose-pine",
	-- "tokyonight-day",

	-- "catppuccin-mocha",
}

local current_index = 1

-- toggle between specified colorschemes
function toggleColorScheme()
	local current = vim.g.colors_name

	-- Update current_index if current colorscheme is in our list
	for i, scheme in ipairs(colorschemes) do
		if scheme == current then
			current_index = i
			break
		end
	end

	-- Cycle to next scheme
	current_index = (current_index % #colorschemes) + 1
	local next_scheme = colorschemes[current_index]

	-- Apply the colorscheme with error handling
	local ok, err = pcall(vim.cmd, "colorscheme " .. next_scheme)
	if ok then
		vim.notify("Switched to " .. next_scheme .. " theme")
	else
		vim.notify("Failed to load colorscheme: " .. next_scheme, vim.log.levels.ERROR)
	end
end
