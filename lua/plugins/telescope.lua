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
      },
      layout_strategy = "horizontal",
      prompt_prefix = "     ",
    }
  },
  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope find_files<cr>",
      desc = "Find files [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fg",
      "<cmd>Telescope live_grep<cr>",
      desc = "Live grep [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fb",
      "<cmd>Telescope buffers<cr>",
      desc = "Buffers [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fh",
      "<cmd>Telescope help_tags<cr>",
      desc = "Help tags [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>ft",
      "<cmd>Telescope<CR>",
      desc = "Open [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fr",
      "<cmd>Telescope resume<CR>",
      desc = "Resume (previous search) [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fvcw",
      "<cmd>Telescope git_commits<CR>",
      desc = "Git commits [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fvcb",
      "<cmd>Telescope git_bcommits<CR>",
      desc = "Git buffer commits [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fvb",
      "<cmd>Telescope git_branches<CR>",
      desc = "Git branches [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fvs",
      "<cmd>Telescope git_status<CR>",
      desc = "Git status [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fvx",
      "<cmd>Telescope git_stash<CR>",
      desc = "Git stash [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>flsb",
      "<cmd>Telescope lsp_document_symbols<CR>",
      desc = "LSP Document Symbols [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>flsw",
      "<cmd>Telescope lsp_workspace_symbols<CR>",
      desc = "LSP Workspace Symbols [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>flr",
      "<cmd>Telescope lsp_references<CR>",
      desc = "LSP References [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fli",
      "<cmd>Telescope lsp_implementations<CR>",
      desc = "LSP Implementations [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>flD",
      "<cmd>Telescope lsp_definitions<CR>",
      desc = "LSP Definitions [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>flt",
      "<cmd>Telescope lsp_type_definitions<CR>",
      desc = "LSP Type Definitions [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fld",
      "<cmd>Telescope diagnostics<CR>",
      desc = "Diagnostics [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    },
    {
      "<leader>fs",
      "<cmd>Telescope treesitter<CR>",
      desc = "Treesitter [Telescope]",
      expr = false,
      mode = "n",
      noremap = true,
      nowait = false,
      script = false,
      silent = true,
      unique = false
    }
  }
}
