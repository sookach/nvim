vim.opt.nu = true
vim.opt.rnu = true

vim.keymap.set({'n', 'v', 'i'}, '<c-h>', '<c-w>h')
vim.keymap.set({'n', 'v', 'i'}, '<c-j>', '<c-w>j')
vim.keymap.set({'n', 'v', 'i'}, '<c-k>', '<c-w>k')
vim.keymap.set({'n', 'v', 'i'}, '<c-l>', '<c-w>l')

require("config.lazy")

vim.lsp.enable('luals')

