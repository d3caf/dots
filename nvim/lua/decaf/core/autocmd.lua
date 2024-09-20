-- Set syntax for lua
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufReadPost" },
  { pattern = { "*.twig" }, command = "set syntax=html" })
