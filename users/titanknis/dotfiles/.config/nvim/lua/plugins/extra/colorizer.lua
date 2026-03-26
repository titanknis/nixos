-- colorizer.lua
-- NOTE: can better integrate with css and tailwindcss and more. read https://github.com/catgoose/nvim-colorizer.lua

---@module 'lazy'
---@type LazySpec
return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {},
}
