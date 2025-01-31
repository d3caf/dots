return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
      },
      { "nvimdev/lspsaga.nvim", opts = {} }
    },
    opts = {
      servers = {
        lua_ls = {},
        eslint = {},
        vtsls = {},
        yamlls = {},
        twiggy_language_server = {},
        cssls = {},
        jsonls = {},
        pyright = {},
        tailwindcss = {},
        ruff = {}
      }
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for server, config in pairs(opts.servers) do
        config.capabilities = capabilities
        lspconfig[server].setup(config)
      end

      -- Keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "cc", vim.lsp.buf.rename, { desc = "LSP rename" })
      vim.keymap.set("n", "<C-x>", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
    end
  },
  {
    'linux-cultist/venv-selector.nvim',
    branch = "regexp",
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    opts = {
      pipenv_path = '/Users/andrew/.local/share/virtualenvs'
      -- Your options go here
      -- name = "venv",
      -- auto_refresh = false
    },
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      -- { '<leader>vs', '<cmd>VenvSelect<cr>' },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      -- { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
  },
  --  {
  --    "yioneko/nvim-vtsls"
  --  },
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
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig",         -- optional
    },
  }
}
