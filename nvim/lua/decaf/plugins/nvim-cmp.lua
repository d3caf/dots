return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source text in buffer
    "hrsh7th/cmp-path",   -- source file system paths
    "hrsh7th/vim-vsnip",
    "tailwind-tools",
    "onsails/lspkind-nvim"
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      formatting = {
        format = require("lspkind").cmp_format({
          before = require("tailwind-tools.cmp").lspkind_format
        })
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = {
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
        ['<C-y>'] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          { 'i', 'c', 's' }
        ),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'treesitter' },
        { name = 'buffer' },
        { name = 'path' },
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end
      },
    })
  end,
}
