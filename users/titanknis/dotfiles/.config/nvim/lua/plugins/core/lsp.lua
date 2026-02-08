-- lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
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

			vim.lsp.config("clangd", {
				init_options = {
					fallbackFlags = { "-DLOCAL" }, -- Define LOCAL for LSP to highlight code inside #ifdef LOCAL
				},
			})
			vim.lsp.config("lua_ls", {
				settings = {
					-- Nvim Lua
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.enable({
				"clangd", -- C, C++
				"rust_analyzer", -- Rust
				"gopls", --Go
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
			})
		end,
	},
}
