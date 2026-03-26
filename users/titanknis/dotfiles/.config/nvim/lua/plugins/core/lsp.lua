-- lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- "mason-org/mason.nvim",
			-- "mason-org/mason-lspconfig.nvim",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local bufopts = { noremap = true, silent = true, buffer = bufnr }
					-- 	-- Keybindings for LSP
					vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, bufopts)
					vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
					vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, bufopts)
					vim.keymap.set("n", "ca", vim.lsp.buf.code_action, bufopts) -- Code Action
					vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, bufopts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts) -- Rename Symbol
				end,
			})

			vim.lsp.enable({
				"clangd", -- C, C++
				"rust_analyzer", -- Rust
				"gopls", -- Go
				"jdtls", -- Java
				"pyright", -- Python
				"bashls", -- Bash
				"nixd", -- Nix
				"lua_ls", -- Nvim Lua
				"html", -- HTML
				"cssls", -- CSS
				"jsonls", -- JSON
				"ts_ls", -- JS and TS
				"hyprls", -- hyprland configs
				"texlab", -- Latex
				-- "dartls", -- Dart for flutter (will be set up by flutter-tools plugin)
			})

			vim.lsp.config("clangd", {
				init_options = {
					fallbackFlags = { "-DLOCAL" }, -- Define LOCAL for LSP to highlight code inside #ifdef LOCAL
				},
			})

			---@type vim.lsp.Config
			---@type lspconfig.settings.lua_ls
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							preloadFileSize = 10000,
							library = { vim.env.VIMRUNTIME },
						},
						-- telemetry = { enable = false },
					},
				},
			})
		end,
	},
}
