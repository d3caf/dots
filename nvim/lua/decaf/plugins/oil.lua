return {
  'stevearc/oil.nvim',
  opts = {
    view_options = {
      show_hidden = true
    }
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
