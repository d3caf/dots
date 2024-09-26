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

      -- Eslint
      lspconfig.eslint.setup {}

      -- Typescript
      lspconfig.vtsls.setup {}

      -- Elixir
      -- lspconfig.elixirls.setup {
      --   cmd = { vim.fn.expand("$HOME/.local/bin/elixirls") }
      -- }
      lspconfig.lexical.setup {
        cmd = { vim.fn.expand("$HOME/c/lexical/_build/dev/package/lexical/bin/start_lexical.sh") },
        root_dir = function(fname)
          return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
        end,
        filetypes = { "elixir", "eelixir", "heex" },
        -- optional settings
        settings = {}
      }

      -- Rust
      lspconfig.rust_analyzer.setup {}

      -- YAML
      lspconfig.yamlls.setup {}

      -- Twig
      lspconfig.twiggy_language_server.setup {}

      -- CSS
      lspconfig.cssls.setup {}
     
      -- JSON
      lspconfig.jsonls.setup {}

      -- Python
      lspconfig.pyright.setup {}

      -- Keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "cc", vim.lsp.buf.rename, { desc = "LSP rename" })
      vim.keymap.set("n", "<C-x>", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
    end
  },
  {
    "yioneko/nvim-vtsls"
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "DNLHC/glance.nvim",
    config = function()
      require("glance").setup({})

      vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>", { desc = "Glance definitions" })
      vim.keymap.set("n", "gR", "<CMD>Glance references<CR>", { desc = "Glance references" })
      vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>", { desc = "Glance type definitions" })
      vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>", { desc = "Glance implementations" })
    end,
    event = { "LspAttach" }
  }
}
