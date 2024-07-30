return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', "nvim-telescope/telescope-fzf-native.nvim" },
    keys = function()
      local tele = require('telescope.builtin')
      return {
        { '<leader>ff',      tele.find_files, 'n', { desc = "Find files" } },
        { '<leader><Space>', tele.find_files, 'n', { desc = "Find files" } },
        { '<leader>fg',      tele.live_grep,  'n', { desc = "Find by grep" } },
        { '<leader>/',       tele.live_grep,  'n', { desc = "Find by grep" } },
        { '<leader>fb',      tele.buffers,    'n', { desc = "Find buffers" } },
        { '<leader>fh',      tele.help_tags,  'n', { desc = "Find help" } },
      }
    end,
  },
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "nvim-tree/nvim-web-devicons"
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim"
  }
}
