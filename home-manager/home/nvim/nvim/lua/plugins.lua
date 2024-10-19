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

