return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup {
      tab = { sync = { open = true, close = true } }
    }
  end
}
