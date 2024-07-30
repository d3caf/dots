return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local util = require("lspconfig/util")

      local capabilities = cmp_nvim_lsp.default_capabilities()

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, bufnr = bufnr }
        local g_opts = { noremap = true, silent = true }

        local toggle_hints = function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end
      end

      -- Lua
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      }

      -- Typescript
      lspconfig.vtsls.setup {}

      -- Elixir
      lspconfig.elixirls.setup {
        cmd = { "/Users/aanguiano/.local/bin/elixirls" }
      }

      -- Rust
      lspconfig.rust_analyzer.setup {}

      -- Keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "cc", vim.lsp.buf.rename, { desc = "LSP rename" })
    end
  },
  {
    "yioneko/nvim-vtsls"
  }
}
