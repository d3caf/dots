-- Set syntax for lua
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufReadPost" },
  { pattern = { "*.twig" }, command = "set syntax=html" })

-- Format modifications
vim.api.nvim_create_autocmd({ "LspAttach" }, {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    vim.api.nvim_buf_create_user_command(
      args.buf,
      "FormatModifications",
      function()
        if client.supports_method("textDocument/rangeFormatting") then
          require "lsp-format-modifications".format_modifications(client, args.buf)
        end
      end,
      {}
    )

    local augroup_id = vim.api.nvim_create_augroup("FormatModificationsDocumentFormattingGroup", { clear = false })
    vim.api.nvim_clear_autocmds({ group = augroup_id, buffer = args.buf })

    vim.api.nvim_create_autocmd(
      { "BufWritePre" },
      {
        group = augroup_id,
        buffer = args.buf,
        callback = function()
          if client.supports_method("textDocument/rangeFormatting") then
            require "lsp-format-modifications".format_modifications(client, args.buf)
          end
        end
      }
    )
  end
})
-- Black formatter for py
-- vim.api.nvim_create_augroup("black_on_save", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.py" },
--   command = "Black",
--   group = "black_on_save"
-- })
