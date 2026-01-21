local plugin = {
  "AlphaTechnolog/pywal.nvim",
  lazy = false,
  name = "pywal",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "pywal"
  end
}
return plugin
