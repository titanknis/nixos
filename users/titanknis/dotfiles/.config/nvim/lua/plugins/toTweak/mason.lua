-- mason.lua
return {
	"mason-org/mason.nvim",
	cond = vim.fn.executable("nix") ~= 1,
	lazy = false,
	opts = {
		ensure_installed = {
			"clangd", -- c, cpp
			"rust_analyzer", -- rust
			"gopls", -- go
			"jdtls", -- java
			"pyright", -- python
			"bash-language-server", -- sh
			"lua_ls", -- lua
			"texlab", -- latex
			"ts_ls", -- js, ts
			"html", -- html
			"cssls", -- css
			"jsonls", -- json

			-- formatters (mason-managed)
			"clang-format", -- c, cpp
			"prettier", -- md, css, html, js, json, jsonc
			"black", -- python
			"shfmt", -- sh
			"stylua", -- lua
			-- LSPs
			"texlab",
			-- treesitter
			"tree-sitter-cli",
			"nixfmt",
		},
	},
}
