vim.api.nvim_create_user_command("EditConfig", function()
    vim.cmd("e ~/.config/nvim")
  end,
  {})
