-- gitsigns.lua
return {

  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      -- You can add custom settings here in the future
      -- For now it uses all defaults
    })
  end,

}
