-- plugins.lua

-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Define your plugin specifications
local plugins = {
    { "nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' } }, -- Fuzzy finder
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Syntax highlighting
    { "tpope/vim-fugitive" },                      -- Git integration
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },  -- Tokyo Night theme with configuration
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },  -- Status line with icons support
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    { 'windwp/nvim-autopairs' },
    { "nvim-tree/nvim-tree.lua", -- Nvim Tree for file navigation
        dependencies = { "nvim-tree/nvim-web-devicons" },

    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    { 'mbbill/undotree' },


--    { "williamboman/mason.nvim" },
    {
        "neovim/nvim-lspconfig",
	dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        },
    },

    -- Autocompletion plugins
    { 'hrsh7th/nvim-cmp' }, -- Completion engine
    { 'hrsh7th/cmp-buffer' }, -- Buffer completions
    { 'hrsh7th/cmp-path' }, -- Path completions
    { 'hrsh7th/cmp-cmdline' }, -- Command line completions
    { 'hrsh7th/cmp-nvim-lsp' }, -- LSP completions
    { 'saadparwaiz1/cmp_luasnip' }, -- Snippet completions

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },

    -- LSP
    { 'neovim/nvim-lspconfig' },

}

-- Set up lazy.nvim with your plugin specifications
require("lazy").setup(plugins)


require("bufferline").setup{}

-- Lualine setup
require('lualine').setup {
  options = { theme = 'tokyonight' },
  sections = {
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {'filename', file_status = true, path = 1},  -- File name with icon
      'filetype',  -- Filetype with icon
    },
  },
}

-- Nvim-tree setup
require("nvim-tree").setup( { filters = { dotfiles = true } } )


require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "java", "python", "nix", "lua", "vim"}, -- Install parsers
  auto_install = true, -- Automatically install missing parsers when entering buffer

  highlight = {
    enable = true, -- Enable syntax highlighting
    additional_vim_regex_highlighting = false, -- Disable regex-based highlighting
  },
  indent = {
    enable = true, -- Enable automatic indentation
  },
  
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-n>",
      node_incremental = "<C-n>",
      scope_incremental = "<C-s>",
      node_decremental = "<C-m>",
    }
  },
}

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

-- Example: Set up Python LSP
require('lspconfig').pyright.setup{
  capabilities = capabilities
}
