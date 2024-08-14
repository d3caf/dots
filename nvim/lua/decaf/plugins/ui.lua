return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      auto_hide = 2
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
  }
}
