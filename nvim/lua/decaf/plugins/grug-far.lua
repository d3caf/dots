return
{
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup({
    });
  end,
  keys = {
    { '<Leader>fR', '<CMD>GrugFar<CR>', 'n', { desc = "Find/replace with Grug" } }
  }
}
