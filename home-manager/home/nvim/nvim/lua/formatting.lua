-- Simple formatting setup using built-in features
-- Put this in your init.lua

-- Set up formatters per filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local formatters = {
      python = "black -",
      lua = "stylua -",
      c = "clang-format",
      cpp = "clang-format",
      java = "google-java-format -",
      --rust = "rustfmt",
      --go = "gofmt",
      json = "prettier --parser json",
      html = "prettier --parser html",
      css = "prettier --parser css",
      yaml = "prettier --parser yaml",
      javascript = "prettier --parser typescript --stdin-filepath ${INPUT}",
      typescript = "prettier --parser typescript --stdin-filepath ${INPUT}",
    }
    
    local ft = vim.bo.filetype
    if formatters[ft] then
      vim.bo.formatprg = formatters[ft]
    end
  end
})

-- Format function that tries formatprg first, then LSP
local function format_buffer()
  -- Use formatprg if available
  if vim.bo.formatprg ~= "" then
    local view = vim.fn.winsaveview()
    vim.cmd("normal gggqG")
    vim.fn.winrestview(view)
    return
  end
  
  -- Otherwise try LSP formatting
  vim.lsp.buf.format({ timeout_ms = 3000 })
end

-- Format keybinding
vim.keymap.set("n", "<leader>fd", format_buffer, { desc = "Format buffer" })

-- Optional: Format on save for specific filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.py", "*.js", "*.ts", "*.lua", "*.c", "*.cpp", "*.java"},
  callback = format_buffer
})
