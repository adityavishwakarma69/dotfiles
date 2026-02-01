--vim options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autochdir")
vim.cmd("set rnu")
vim.cmd("tnoremap <Esc> <C-\\><C-n>")
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>h', ':winc h<CR>')
vim.keymap.set('n', '<leader>l', ':winc l<CR>')
vim.keymap.set('n', '<leader>j', ':winc j<CR>')
vim.keymap.set('n', '<leader>k', ':winc k<CR>')
