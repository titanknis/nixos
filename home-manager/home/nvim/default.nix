
{ pkgs, ... }:

{
  home.file.".config/nvim/init.lua".source = ./nvim/init.lua;
  home.file.".config/nvim/lua/settings.lua".source = ./nvim/lua/settings.lua;
  home.file.".config/nvim/lua/mappings.lua".source = ./nvim/lua/mappings.lua;
  home.file.".config/nvim/lua/plugins.lua".source = ./nvim/lua/plugins.lua;
}

