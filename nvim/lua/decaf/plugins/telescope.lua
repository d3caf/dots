return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = 'make',
        config = function()
          require('telescope').load_extension('fzf')
        end
      }
    },
    keys = function()
      local tele = require('telescope.builtin')
      return {
        { '<leader>ff',      tele.find_files,            'n', { desc = "Find files" } },
        { '<leader><Space>', tele.find_files,            'n', { desc = "Find files" } },
        { '<leader>fg',      tele.live_grep,             'n', { desc = "Find by grep" } },
        { '<leader>/',       tele.live_grep,             'n', { desc = "Find by grep" } },
        { '<leader>fb',      tele.buffers,               'n', { desc = "Find buffers" } },
        { '<leader>fh',      tele.help_tags,             'n', { desc = "Find help" } },
        { '<leader>fs',      tele.lsp_document_symbols,  'n', { desc = "Find symbols in document" } },
        { '<leader>fS',      tele.lsp_workspace_symbols, 'n', { desc = "Find symbols in workspace" } }
      }
    end,
  },
}
