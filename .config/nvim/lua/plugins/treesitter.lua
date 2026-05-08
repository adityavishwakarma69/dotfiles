local plugin = {"nvim-treesitter/nvim-treesitter",
  name = "treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {"lua", "python", "rust"},
      highlight = {enable = true},
      indent = {enable = true}
    })
  end
}
return plugin
