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
  },
  {
    "9seconds/repolink.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    cmd = {
      "RepoLink"
    },
    keys = {
      { "<leader>vL", "<cmd>:RepoLink! main<CR>", desc = "Copy link to line on main" },
      { "<leader>vl", "<cmd>:RepoLink!<CR>",      desc = "Copy link to line on current branch" }
    },
    opts = {}
  },
  {
    "comatory/gh-co.nvim",
    event = {
      "BufRead",
      "BufNewFile"
    },
    keys = {
      { "<leader>vo", "<cmd>:GhCoWho<CR>", desc = "Show file codeowner" }
    }
  }
}
