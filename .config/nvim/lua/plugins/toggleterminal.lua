local plugin = {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function ()

    require('toggleterm').setup()

    vim.keymap.set('n', '<C-t>', ":ToggleTerm<CR>")
    
  end
}

return plugin
