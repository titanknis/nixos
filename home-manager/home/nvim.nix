
{ pkgs, ... }:

{
  home.file.".config/nvim/init.lua".text = ''
    -- init.lua
    require('settings')
    require('mappings')
    require('plugins')
  '';

  home.file.".config/nvim/lua/settings.lua".text = ''
    -- settings.lua

    -- General settings
    vim.o.belloff = "all"               -- Disable bell
    vim.o.clipboard = "unnamedplus"     -- Use system clipboard
    vim.o.number = true                 -- Show line numbers
    vim.o.relativenumber = true         -- Show relative line numbers
    vim.o.expandtab = true              -- Use spaces instead of tabs
    vim.o.shiftwidth = 4                -- Spaces per indent level
    vim.o.tabstop = 4                   -- Spaces per tab
    vim.o.mouse = 'a'                   -- Enable mouse support

    -- Enable syntax highlighting
    vim.cmd("syntax on")
  '';

  home.file.".config/nvim/lua/mappings.lua".text = ''
    -- mappings.lua

    -- Define mapleader
    vim.g.mapleader = " "

    -- Define key mappings
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map('n', '<leader>n', ':set relativenumber!<CR>', opts)
    map('n', '<leader>q', ':q!<CR>', opts)
    map('n', '<leader>w', ':w<CR>', opts)
    map('n', '<leader>x', ':x<CR>', opts)
    map('n', '<leader>y', '"+y', opts)  -- Yank to system clipboard
    map('n', '<leader>p', '"+p', opts)  -- Paste from system clipboard

    -- Plugin-specific mappings
    map('n', '<leader>t', ':NERDTreeToggle<CR>', opts)
  '';

  home.file.".config/nvim/lua/plugins.lua".text = ''
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
        { "preservim/nerdtree" },                     -- NERDTree for file navigation
        { "nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' } }, -- Fuzzy finder
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Syntax highlighting
        { "tpope/vim-fugitive" },                      -- Git integration
    }

    -- Set up lazy.nvim with your plugin specifications
    require("lazy").setup(plugins)
  '';
}

