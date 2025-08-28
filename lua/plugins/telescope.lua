return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      layout_config = {
        height = .8,
        horizontal = {
          preview_width = .55,
          prompt_position = "top"
        },
        preview_cutoff = 120,
        vertical = {
          mirror = false
        },
        width = .8
      }
    }
  }
}
