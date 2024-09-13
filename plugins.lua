-- Bootstrap Pckr
local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

if not vim.uv.fs_stat(pckr_path) then
   vim.fn.system({ 'git', 'clone', "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
   })
end
vim.opt.rtp:prepend(pckr_path)

local cmd = require('pckr.loader.cmd')
require('pckr').add({
   'nvim-lua/plenary.nvim',     -- library

   --
   -- Completion
   'hrsh7th/nvim-cmp',    -- Completion Engine
   'hrsh7th/cmp-buffer',  -- .. from buffer
   'hrsh7th/cmp-path',    -- .. from file path
   'hrsh7th/cmp-cmdline', -- .. from command line
   'hrsh7th/cmp-calc',    -- .. as a calculator
   'f3fora/cmp-spell',    -- .. from spell check
   'petertriho/cmp-git',  -- .. from git
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
   'nvim-telescope/telescope.nvim', -- Fuzzy find files

   { 'nvim-telescope/telescope-fzf-native.nvim', 
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      cond = cmd('Telescope')
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

   {'Saecki/crates.nvim', config = function()
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
   end }, -- Crates.io integration

   {'numToStr/Comment.nvim', config = function()
      require('Comment').setup()
      require('Comment.ft').hjson = '#%s'
   end }, -- Commenting code

   --
   -- Appearance
   'nvim-lualine/lualine.nvim',   -- status line
   'nvim-tree/nvim-web-devicons', -- icons library
   'psliwka/vim-smoothie',        -- smooth scrolling
   'lewis6991/gitsigns.nvim',     -- visual git integration
   {'RRethy/vim-illuminate', config = function()
      require('illuminate').configure({
         delay = 10,
         under_cursor = false,
      })
   end }, -- passive highlight current word

   {'lukas-reineke/indent-blankline.nvim', config = function()
      require("ibl").setup()
   end }, -- ghost characters for spaces, tabs, and newlines

   -- {'mawkler/modicator.nvim', config = function()
   --    require("modicator").setup()
   -- end }, -- indicate current mode near cursor

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
   end }, -- syntax highlighting
})
