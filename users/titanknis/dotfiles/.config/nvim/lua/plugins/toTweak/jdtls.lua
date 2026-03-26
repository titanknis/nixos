-- nvim-jdtls.lua
return {
	"mfussenegger/nvim-jdtls",

	config = function()
		vim.lsp.enable("jdtls")
	end,
}
