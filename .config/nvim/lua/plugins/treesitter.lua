local plugin = {"nvim-treesitter/nvim-treesitter",
  name = "treesitter",
  build = ":TSUpdate",
  config = function()

    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installer = {"lua", "python", "rust"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
return plugin
