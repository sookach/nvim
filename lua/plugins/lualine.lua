return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true,
    keys = {
      { '<leader>t', '<cmd>NvimTreeToggle<cr>', mode = 'n' }
    }
}
