return {
  {
    "lewis6991/gitsigns.nvim",
    config = {
      current_line_blame = true
    },
    event = { "BufRead", "BufNewFile" },
  },
  {
    "tpope/vim-fugitive",
  }
}
