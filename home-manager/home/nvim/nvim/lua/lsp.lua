
 -- Set up nvim-cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- Set up lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, bufnr)
local bufopts = { noremap = true, silent = true, buffer = bufnr }
-- Keybindings for LSP
vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, opts)
vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, opts)
--vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_workspace_symbols, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)             -- Hover Info
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)   -- Rename Symbol
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- Code Action

end


-- Example: Set up Python LSP
require('lspconfig').pyright.setup{ capabilities = capabilities, on_attach = on_attach}
require('lspconfig').jdtls.setup{ capabilities = capabilities, on_attach = on_attach }
require('lspconfig').clangd.setup{ capabilities = capabilities, on_attach = on_attach }
