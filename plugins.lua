-- Bootstrap Pckr
local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

if not vim.uv.fs_stat(pckr_path) then
   vim.fn.system({ 'git', 'clone', "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim', pckr_path
   })
end
vim.opt.rtp:prepend(pckr_path)

local cmd = require('pckr.loader.cmd')
local event = require('pckr.loader.event')
local keys = require('pckr.loader.keys')
require('pckr').add({
   "nvim-lua/plenary.nvim",
   {"lewis6991/pckr.nvim",
      requires = { "nvim-lua/plenary.nvim" }
   },

	-- I hate this shit cabbage
	{'neovim/nvim-lspconfig', 
		requires = { 'hrsh7th/cmp-nvim-lsp' }, 
      cond = event('BufReadPost', '*.rs'),
		config = function() 
			local cap = require('cmp_nvim_lsp').default_capabilities()
			local lc = require("lspconfig")

			cap.textDocument.completion.completionItem.labelDetailsSupport = false

			lc.rust_analyzer.setup({
				capabilities = cap,
				setting = {
					['rust-analyzer'] = {},
				}
			})

			vim.lsp.inlay_hint.enable(false)
			vim.diagnostic.enable(false)
	end },

   -- Completion
   {'hrsh7th/nvim-cmp', requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'f3fora/cmp-spell',
		'davidsierradz/cmp-conventionalcommits',
		'onsails/lspkind.nvim',
   }},-- Completion
   {'github/copilot.vim', config = function() 
      vim.g.copilot_filetypes = { ["*"] = true }
      vim.keymap.set('i', "\\", 'copilot#Accept("\\\\")', { expr = true, replace_keycodes = false })
      vim.keymap.set('i', "<M-\\>", '\\', {})
      vim.g.copilot_no_tab_map = true
   end },

   --
   -- File Managment / Navigation
   {'is0n/fm-nvim',                  cond = cmd('Xplr')},   -- Used for the File Manager `xplr`
   {'tpope/vim-fugitive',            cond = cmd('Git')},    -- Git integration
   {'nvim-telescope/telescope.nvim', 
      config = function() require('telescope').setup() end,
      cond = cmd('Telescope'),
      requires = { 'nvim-lua/plenary.nvim' }
   }, -- Fuzzy find files

   {'pwntester/octo.nvim', 
      config = function() require('octo').setup() end,
      cond = cmd('Octo'),
      requires = { 
         'nvim-lua/plenary.nvim',
         'nvim-tree/nvim-web-devicons',
         'nvim-telescope/telescope.nvim'
      }
   },


   --
   -- Utils
   'folke/which-key.nvim',    -- Keybind hints
   'mg979/vim-visual-multi',  -- Multi cursor support
   {'akinsho/toggleterm.nvim', config = function() 
      require('toggleterm').setup{
         size = 20,
         open_mapping = [[<c-\>]],
         shade_filetypes = {},
         shade_terminals = true,
         shading_factor = '1',
         start_in_insert = true,
         direction = 'float',
         close_on_exit = true,
         auto_scroll   = true,
         hidden = true,
         shell = vim.o.shell,
      }
   end }, -- Floating terminal

   {'Saecki/crates.nvim', 
      cond = event('BufReadPost', 'Cargo.toml'),
      requires = { 'hrsh7th/nvim-cmp' },
      config = function()
         require('crates').setup {
            completion = { 
               crates = { 
                  enabled = true,
                  max_results = 8,
                  min_chars = 3,
               },
               cmp = { enabled = true } 
            },
            popup = { autofocus = true, },
         }
      end,
   }, -- Crates.io integration

   {'numToStr/Comment.nvim', 
      cond = { keys('n', 'gc'), keys('v', 'gc') },
      config = function() require('Comment').setup() end 
   }, -- Commenting code

   --
   -- Appearance
   {'lewis6991/gitsigns.nvim', config = function()
      require('gitsigns').setup({
         signs = {
            add = { text = " +" },
            change = { text = " ~" },
            delete = { text = " -" },
            topdelete = { text = " -" },
            changedelete = { text = " ~" },
            untracked = { text = " |" },
         },
         signs_staged = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "-" },
            topdelete = { text = "-" },
            changedelete = { text = "~" },
            untracked = { text = "|" },
         },
      })
   end },     -- visual git integration
   {'psliwka/vim-smoothie', config_pre = function()
      vim.g.smoothie_enabled = 1
   end },        -- smooth scrolling
   {'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
   },

   {'RRethy/vim-illuminate', config = function()
      require('illuminate').configure({
         delay = 10,
         under_cursor = false,
      })
   end }, -- passive highlight current word

   {'lukas-reineke/indent-blankline.nvim', 
      config = function() require("ibl").setup() end 
   }, -- ghost characters for spaces, tabs, and newlines

   {'nvim-treesitter/nvim-treesitter', config = function()
      require('nvim-treesitter.configs').setup({
         ensure_installed = { 
            "c", "cpp", "rust", "lua", "markdown",
            "markdown_inline", "toml", "bash", "clojure",
         },
         highlight = { 
            enable = true,
            disable = { "rust" },
         },
         indent = { enable = true },
      })

      -- hack to prevent treesitter from overriding the tab settings
      vim.api.nvim_create_autocmd("FileType", {
         pattern = "*",
         callback = function()
            vim.bo.expandtab    = false
            vim.bo.shiftwidth   = 3
            vim.bo.tabstop      = 3
         end
      })
   end }, -- syntax highlighting
})
