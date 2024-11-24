{pkgs, ...}: {
   home.file.".config/nvim/init.lua".source = ./nvim/init.lua;
   # lua
   home.file.".config/nvim/lua/options.lua".source = ./nvim/lua/options.lua;
   home.file.".config/nvim/lua/keymaps.lua".source = ./nvim/lua/keymaps.lua;
   home.file.".config/nvim/lua/autocmds.lua".source = ./nvim/lua/autocmds.lua;
  
   # plugins
   home.file.".config/nvim/lua/plugins/init.lua".source = ./nvim/lua/plugins/init.lua;
   home.file.".config/nvim/lua/plugins/lsp.lua".source = ./nvim/lua/plugins/lsp.lua;
   home.file.".config/nvim/lua/plugins/treesitter.lua".source = ./nvim/lua/plugins/treesitter.lua;
   home.file.".config/nvim/lua/plugins/conform.lua".source = ./nvim/lua/plugins/conform.lua;
   home.file.".config/nvim/lua/plugins/obsidian.lua".source = ./nvim/lua/plugins/obsidian.lua;
   home.file.".config/nvim/lua/plugins/pomo.lua".source = ./nvim/lua/plugins/pomo.lua;
}
