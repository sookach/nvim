vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>T', vim.cmd.Ex)
vim.opt.number = true
vim.api.nvim_set_option("clipboard", "unnamed")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'folke/tokyonight.nvim',
		priority = 1000,
		init = function()
			vim.cmd.colorscheme 'tokyonight-night'
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown {} }
				}
			}
			require("telescope").load_extension("ui-select")
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup {
				ensure_installed = { "c", "cmake", "cpp", "llvm", "lua", "vim", "vimdoc", "query" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true }
			}
		end
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')
			vim.keymap.set('n', '<leader>w', '<C-w>w')
			vim.keymap.set('n', '<leader>h', '<C-w>h')
			vim.keymap.set('n', '<leader>j', '<C-w>j')
			vim.keymap.set('n', '<leader>k', '<C-w>k')
			vim.keymap.set('n', '<leader>l', '<C-w>l')

			vim.keymap.set('n', '<leader>tn', vim.cmd.tabnext)
			vim.keymap.set('n', '<leader>tp', vim.cmd.tabprevious)
			vim.keymap.set('n', '<leader>tc', vim.cmd.tabclose)
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup { theme = 'dracula' }
		end
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require('mason').setup {
				ensure_installed = {
					'clangd',
					'clang-format'
				}
			}
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = {
					'clangd',
					'lua_ls'
				}
			}
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.lua_ls.setup {}
			lspconfig.clangd.setup {}
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, {})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
		end
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
			'hrsh7th/cmp-nvim-lsp'
		},
		config = function()
			local cmp = require 'cmp'
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup {
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert {
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm { select = true },
				},
				sources = cmp.config.sources {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				},
				{
					{ name = 'buffer' },
				}
			}

			require 'cmp'.setup {
				sources = {
					{ name = 'nvim_lsp' }
				}
			}

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
			require('lspconfig').clangd.setup {
				capabilities = capabilities,
			}
		end
	},
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'rcarriga/nvim-dap-ui',
			'nvim-neotest/nvim-nio'
		},
		config = function()
			local dap, dapui = require "dap", require "dapui"

			dapui.setup()

			vim.keymap.set('n', '<leader>d;', dap.toggle_breakpoint)
			vim.keymap.set('n', '<leader>df', dap.continue)
			vim.keymap.set('n', '<leader>dj', dap.step_over)
			vim.keymap.set('n', '<leader>dk', dap.step_into)
			vim.keymap.set('n', '<leader>dl', dap.step_out)

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			dap.adapters.lldb = {
				type = 'executable',
				command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
				name = 'lldb'
			}

			local clang_configs = {
				{
					name = "C++ Debug And Run",
					type = "codelldb",
					request = "launch",
					program = function()
						-- First, check if exists CMakeLists.txt
						local cwd = vim.fn.getcwd()
						if file.exists(cwd, "CMakeLists.txt") then
							-- Then invoke cmake commands
							-- Then ask user to provide execute file
							return vim.fn.input("Path to executable: ",
								vim.fn.getcwd() .. "/", "file")
						end
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					runInTerminal = true,
					console = "integratedTerminal",
				},
			}
		end
	},
	{
		'akinsho/bufferline.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
		--		config = function()
		--			vim.opt.termguicolors = true
		--			require("bufferline").setup {}
		--		end
	},
	{
		'akinsho/toggleterm.nvim',
		config = function()
			local term = require 'toggleterm'
			vim.keymap.set({ 'n', 't' }, '<C-`>', term.toggle)
			vim.keymap.set({ 't' }, '<Esc>', '<C-\\><C-n>')
		end
	},
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false

			vim.keymap.set('n', '<leader>bn', ':BufferNext<CR>')
			vim.keymap.set('n', '<leader>bp', ':BufferPrevious<CR>')
			vim.keymap.set('n', '<leader>bc', ':BufferClose<CR>')
		end,
		opts = {},
	}
})
