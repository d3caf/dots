-- Set syntax for lua
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufReadPost" },
  { pattern = { "*.twig" }, command = "set syntax=html" })

-- Black formatter for py
-- vim.api.nvim_create_augroup("black_on_save", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.py" },
--   command = "Black",
--   group = "black_on_save"
-- })
