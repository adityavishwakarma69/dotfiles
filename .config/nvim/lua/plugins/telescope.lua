local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    name = "telescope",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", {})
      vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", {})
      vim.keymap.set('n', '<leader>th', ":Telescope colorscheme<CR>", {})
      vim.keymap.set('n', '<leader>fh', ":Telescope oldfiles<CR>", {})
      vim.keymap.set('n', '<leader>fm', ":Telescope marks<CR>", {})
      vim.keymap.set('n', '<leader>b', ":Telescope buffers<CR>", {})
 --     vim.keymap.set('n', '<C-n>', ":Telescope file_browser<CR>", {})
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function ()
      require("telescope").load_extension "file_browser"
    end
  }
}
return plugins
