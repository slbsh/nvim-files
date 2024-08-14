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
   'hrsh7th/nvim-cmp',          -- Completion Engine
   'hrsh7th/cmp-buffer',        -- .. from buffer
   'hrsh7th/cmp-path',          -- .. from file path
   'hrsh7th/cmp-cmdline',       -- .. from command line
   'hrsh7th/cmp-calc',          -- .. as a calculator
   'f3fora/cmp-spell',          -- .. from spell check
   {'github/copilot.vim', config = function() 
      vim.g.copilot_filetypes = { ["*"] = true }
      vim.keymap.set('i', "\\", 'copilot#Accept("\\\\")', { expr = true, replace_keycodes = false })
      vim.keymap.set('i', "<M-\\>", '\\', {})
      vim.g.copilot_no_tab_map = true
   end },



   --
   -- File Managment / Navigation
   {'nvim-telescope/telescope.nvim', config = __telescope}, -- Fuzzy find files
   {'is0n/fm-nvim',                  cond = cmd('Xplr')},   -- Used for the File Manager `xplr`
   {'tpope/vim-fugitive',            cond = cmd('Git')},    -- Git integration
   { 'nvim-telescope/telescope-fzf-native.nvim', 
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      cond = cmd('Telescope')
   },

   --
   -- Utils
   'folke/which-key.nvim',          -- Keybind hints
   'mg979/vim-visual-multi',        -- Multi cursor support
   'akinsho/toggleterm.nvim',       -- Floating terminal
   {'fedepujol/move.nvim', config = function() 
      require('move').setup({
         char = { enable = true, },
      })

      local opts = { noremap = true, silent = true }
      -- Normal-mode commands
      vim.keymap.set('n', '<C-j>', ':MoveLine(1)<CR>', opts)
      vim.keymap.set('n', '<C-k>', ':MoveLine(-1)<CR>', opts)
      vim.keymap.set('n', '<C-h>', ':MoveHChar(-1)<CR>', opts)
      vim.keymap.set('n', '<C-l>', ':MoveHChar(1)<CR>', opts)
      -- vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
      -- vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)
      -- Visual-mode commands
      vim.keymap.set('v', '<C-j>', ':MoveBlock(1)<CR>', opts)
      vim.keymap.set('v', '<C-k>', ':MoveBlock(-1)<CR>', opts)
      vim.keymap.set('v', '<C-h>', ':MoveHBlock(-1)<CR>', opts)
      vim.keymap.set('v', '<C-l>', ':MoveHBlock(1)<CR>', opts)
   end },

   {'Saecki/crates.nvim', config = function()
      require('crates').setup()
   end }, -- Crates.io integration

   {'numToStr/Comment.nvim', config = function()
      require('Comment').setup()
      require('Comment.ft').hjson = '#%s'
   end }, -- Commenting code



   --
   -- Appearance
   'nvim-lualine/lualine.nvim',           -- status line
   'nvim-tree/nvim-web-devicons',         -- icons library
   'psliwka/vim-smoothie',                -- smooth scrolling
   'lewis6991/gitsigns.nvim',             -- visual git integration

   {'RRethy/vim-illuminate', config = function()
      require('illuminate').configure({
         delay = 10,
         under_cursor = false,
      })
   end }, -- passive highlight current word

   {'lukas-reineke/indent-blankline.nvim', config = function()
      require("ibl").setup()
   end }, -- ghost characters for spaces, tabs, and newlines

   {'mawkler/modicator.nvim', config = function()
      require("modicator").setup()
   end }, -- indicate current mode near cursor
})
