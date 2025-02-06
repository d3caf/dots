return {
  {
    "mhartington/formatter.nvim",
    config = function()
      -- See https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
      require("formatter").setup {
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
          python = {
            require("formatter.filetypes.python").black,
            require("formatter.filetypes.python").ruff
          },
          typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier
          },
          typescript = {
            require("formatter.filetypes.typescript").prettier
          },
          javascript = {
            require("formatter.filetypes.javascript").prettier
          },
          javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettier
          },
          graphql = {
            require("formatter.filetypes.graphql").prettier
          }
        }
      }
    end
  },
  {
    'joechrisellis/lsp-format-modifications.nvim',

    event = "LspAttach",
    cmd = "FormatModifications",
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  }
}
