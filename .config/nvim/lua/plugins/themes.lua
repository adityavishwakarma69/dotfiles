local plugins = {
  {
    "AlphaTechnolog/pywal.nvim",
    lazy = false,
    name = "pywal",
    priority = 1000,
    config = function ()
      vim.cmd.colorscheme "pywal"
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  }
}

return plugins
