vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.rnu = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ 'n', 'v' }, '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>lg', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action)

require("config.lazy")

vim.lsp.enable('luals')
vim.lsp.enable('clangd')
