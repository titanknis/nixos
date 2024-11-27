-- lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- Set up lspconfig
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(_, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				-- Keybindings for LSP
				vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
				vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
				vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts)
				--vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_workspace_symbols, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts) -- Hover Info
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts) -- Rename Symbol
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts) -- Code Action
			end

			-- Example: Set up Python LSP
			require("lspconfig").pyright.setup({ capabilities = capabilities, on_attach = on_attach })
			require("lspconfig").jdtls.setup({ capabilities = capabilities, on_attach = on_attach })
			require("lspconfig").clangd.setup({ capabilities = capabilities, on_attach = on_attach })
		end,
	},
}
