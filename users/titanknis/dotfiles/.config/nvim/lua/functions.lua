-- -- functions.lua
--
-- local term_buf = nil
-- local term_win = nil
--
-- function TermToggle()
-- 	-- Window is open → hide it
-- 	if term_win and vim.api.nvim_win_is_valid(term_win) then
-- 		vim.api.nvim_win_hide(term_win)
-- 		term_win = nil
-- 		return
-- 	end
--
-- 	-- Buffer exists but window is closed → re-open it
-- 	if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
-- 		vim.cmd("botright split")
-- 		term_win = vim.api.nvim_get_current_win()
-- 		vim.api.nvim_win_set_buf(term_win, term_buf)
-- 		vim.cmd("resize 15")
-- 		vim.cmd("startinsert")
-- 		return
-- 	end
--
-- 	-- First time → create terminal
-- 	vim.cmd("botright split")
-- 	vim.cmd("term")
-- 	vim.cmd("resize 15")
-- 	term_buf = vim.api.nvim_get_current_buf()
-- 	term_win = vim.api.nvim_get_current_win()
-- 	vim.cmd("startinsert")
-- end
--
-- function TermCmd(cmd)
-- 	-- Window is open → Run cmd
-- 	if term_win and vim.api.nvim_win_is_valid(term_win) then
-- 		local chan = vim.bo[term_buf].channel
-- 		vim.api.nvim_chan_send(chan, cmd .. "\n")
-- 		vim.cmd("wincmd j")
-- 		vim.cmd("startinsert")
-- 		return
-- 	end
--
-- 	-- First time → create terminal
-- 	TermToggle()
-- 	local chan = vim.bo[term_buf].channel
-- 	vim.api.nvim_chan_send(chan, cmd .. "\n")
-- end

function RunCode()
	-- Get file info
	local filetype = vim.bo.filetype
	local extension = vim.fn.expand("%:e")
	local file = vim.fn.expand("%:t") -- Just the filename
	local outfile = vim.fn.expand("%:t:r") -- Filename without extension
	local dir = vim.fn.expand("%:p:h") -- Directory of current file
	local filepath = vim.fn.expand("%:p")

	-- Check if file has a package declaration
	local has_package = false
	local f = io.open(filepath, "r")
	if f then
		for line in f:lines() do
			if line:match("^package%s+") then
				has_package = true
				break
			end
		end
		f:close()
	end

	if filetype == "" then
		-- Try to determine by extension
		if extension == "uml" or extension == "puml" or extension == "plantuml" then
			filetype = "plantuml"
		end
	end

	local commands = {
		c = string.format('cd "%s" && clang -pthread "%s" -o "%s" && "./%s"', dir, file, outfile, outfile),
		cpp = string.format('cd "%s" && clang++ "%s" -o "%s" && "./%s"', dir, file, outfile, outfile),
		rust = string.format('cd "%s" && rustc "%s" -o "%s" && "./%s"', dir, file, outfile, outfile),

		go = string.format('cd "%s" && go run "%s"', dir, file),
		java = string.format('cd "%s" && javac "%s" && java "%s"', dir, file, outfile),
		-- dart = string.format('cd "%s" && flutter run', dir),
		dart = string.format('cd "%s" && dart run %s', dir, file),

		javascript = string.format('cd "%s" && node "%s"', dir, file),
		typescript = string.format('cd "%s" && node "%s"', dir, file),
		python = string.format('cd "%s" && python "%s"', dir, file),
		sh = string.format('cd "%s" && bash "%s"', dir, file),

		markdown = string.format('cd "%s" && plantuml "%s" --svg && zathura "./%s.svg"', dir, file, outfile),
		plantuml = string.format('cd "%s" && plantuml "%s" --svg && zathura "./%s.svg"', dir, file, outfile),
		html = string.format('cd "%s"; python3 -m http.server 8000 & xdg-open http://localhost:8000 & exit', dir),
		-- lex = string.format('cd "%s" && flex %s && gcc lex.yy.c -o %s && ./%s < *.txt', dir, file, outfile, outfile),
		lex = string.format(
			'cd "%s" && flex %s && gcc lex.yy.c %s.tab.c -o parser',
			dir,
			file,
			outfile,
			outfile,
			outfile
		),
		yacc = string.format('cd "%s" && bison -d %s', dir, file),
	}

	if has_package then
		-- Has package, so assume standard directory structure
		commands["java"] = string.format(
			'cd "%s/.." && javac "%s/%s" && java "%s/%s"',
			dir,
			vim.fn.expand("%:p:h:t"),
			file,
			vim.fn.expand("%:p:h:t"),
			outfile
		)
	end

	local cmd = commands[filetype]
	if cmd then
		vim.cmd("update")
		-- TermCmd(cmd)
		-- Replace TermCmd(cmd) calls with this:
		require("toggleterm").exec(cmd)
	else
		vim.notify("Filetype not supported for running", vim.log.levels.WARN)
	end
end
