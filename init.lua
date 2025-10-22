vim.opt.nu = true
vim.opt.rnu = true

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ 'n', 'v', 'i' }, '<c-h>', '<c-w>h')
vim.keymap.set({ 'n', 'v', 'i' }, '<c-j>', '<c-w>j')
vim.keymap.set({ 'n', 'v', 'i' }, '<c-k>', '<c-w>k')
vim.keymap.set({ 'n', 'v', 'i' }, '<c-l>', '<c-w>l')
vim.keymap.set({ 'n', 'v' }, '<leader>lf', vim.lsp.buf.format)

require("config.lazy")

vim.lsp.enable('luals')
