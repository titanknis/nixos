
{ pkgs, ... }:

{
  home.file.".config/nvim/init.lua".source = ./nvim/init.lua;
  home.file.".config/nvim/lua/base-settings.lua".source = ./nvim/lua/base-settings.lua;
  home.file.".config/nvim/lua/settings.lua".source = ./nvim/lua/settings.lua;
  home.file.".config/nvim/lua/plugins.lua".source = ./nvim/lua/plugins.lua;
  home.file.".config/nvim/lua/mappings.lua".source = ./nvim/lua/mappings.lua;
  home.file.".config/nvim/lua/functions.lua".source = ./nvim/lua/functions.lua;
  home.file.".config/nvim/lua/tree-sitter.lua".source = ./nvim/lua/tree-sitter.lua;
  home.file.".config/nvim/lua/lsp.lua".source = ./nvim/lua/lsp.lua;
  home.file.".config/nvim/lua/formatting.lua".source = ./nvim/lua/formatting.lua;
  home.file.".config/nvim/lua/ui.lua".source = ./nvim/lua/ui.lua;

}

