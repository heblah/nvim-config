---------------------------------------------
-- Plugins list
---------------------------------------------

return {
	{-- Vim tmux navigator
		'christoomey/vim-tmux-navigator',
		lazy = false,
		config = function()
			vim.g.tmux_navigator_save_on_switch = 2
		end
	},
	{-- Autopairs
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- equivalent to setup({}) function
	},
	{-- Vscode neovim theme
		'Mofiqul/vscode.nvim'
	},
	{-- Theme inspired by Atom
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function()
		  -- vim.cmd.colorscheme 'onedark'
		end,
	},
	-- Git related plugins
	{'tpope/vim-fugitive'},
	{'rbong/vim-flog'},
	{-- Neovim tree
		"nvim-tree/nvim-tree.lua",
  		version = "*",
  		lazy = false,
  		dependencies = {
  		  "nvim-tree/nvim-web-devicons",
  		},
  		config = function()
  		  require("nvim-tree").setup {}
  		end,
	},
	{-- Set lualine as statusline
		'nvim-lualine/lualine.nvim',
		-- See `:help lualine.txt`
		opts = {
		  options = {
			icons_enabled = false,
			theme = 'vscode',
			component_separators = '|',
			section_separators = '',
		  },
		},
	},
	{-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
		  -- Adds LSP completion capabilities
		  'neovim/nvim-lspconfig',
		  'hrsh7th/cmp-nvim-lsp',
		  'hrsh7th/cmp-path',
		  'hrsh7th/cmp-buffer',
		  'hrsh7th/cmp-cmdline',
		},
	},
	{-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
		  -- Automatically install LSPs to stdpath for neovim
		  'williamboman/mason.nvim',
		  'williamboman/mason-lspconfig.nvim',

		  -- Useful status updates for LSP
		  -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		  { 'j-hui/fidget.nvim', opts = {} },

		  -- Additional lua configuration, makes nvim stuff amazing!
		  'folke/neodev.nvim',
		},
	},
    {-- Fuzzy Finder (files, lsp, etc)
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
		  'nvim-lua/plenary.nvim',
		  {
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
			  return vim.fn.executable 'make' == 1
			end,
		  },
		},
	},
	{"akinsho/nvim-toggleterm.lua", version = "*",
		config = true, opts = {}
	},
	--[[
	{-- Plugins to get terminals using telescope
		"ryanmsnyder/toggleterm-manager.nvim",
		dependencies = {
			{"akinsho/nvim-toggleterm.lua", version = "*", opts = {}},
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
		},
		config = true,
	},
	]]
}
