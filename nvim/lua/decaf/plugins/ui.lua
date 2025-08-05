local lsp_clients = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  if next(clients) == nil then
    return ''
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end

  return '\u{f085} ' .. table.concat(c, ' | ')
end

return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      auto_hide = 1
    }
  },
  -- Indent guides
  {
    'echasnovski/mini.indentscope',
    version = '*',
    opts = function()
      return {
        draw = {
          animation = require('mini.indentscope').gen_animation.none(),
        },
        symbol = '│'
      }
    end
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      extensions = { 'lazy', 'mason', 'oil' },
      sections = {
        -- lualine_c = { ':GhCoWho' },
        lualine_x = { lsp_clients, 'filetype' }
      }
    }
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  }
}
