return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      {
        "<leader>f",
        group = "find"
      },
      {
        "<leader>b",
        group = "buffer"
      },
      {
        "<leader>c",
        group = "code"
      },
      {
        "<leader>v",
        group = "vcs",
        icon = ""
      }
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
