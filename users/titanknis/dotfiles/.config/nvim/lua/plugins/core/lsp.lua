-- lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = function(_, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				-- Keybindings for LSP
				vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, bufopts)
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
				vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, bufopts)
				vim.keymap.set("n", "ca", vim.lsp.buf.code_action, bufopts) -- Code Action
				vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts) -- Hover Info
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts) -- Rename Symbol
			end

			local servers = {
				clangd = {
					init_options = {
						fallbackFlags = { "-DLOCAL" }, -- Define LOCAL for LSP to highlight code inside #ifdef LOCAL
					},
				}, -- C, C++
				rust_analyzer = {}, -- Rust

				gopls = {}, -- Go
				jdtls = {}, -- Java

				pyright = {}, -- Python
				bashls = {}, -- Bash

				nixd = {}, -- Nix
				lua_ls = { -- Nvim Lua
					settings = {
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
				},
				html = {}, -- HTML
				cssls = {}, -- CSS
				jsonls = {}, -- JSON
				ts_ls = {}, -- JS and TS
				hyprls = {},
			}

			-- Set up LSP servers
			local lspconfig = require("lspconfig")
			for server, config in pairs(servers) do
				config.capabilities = capabilities
				config.on_attach = on_attach
				lspconfig[server].setup(config)
			end
		end,
	},
}
