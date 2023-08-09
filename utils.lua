require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

require('telescope').load_extension('fzf')

require('harpoon').setup()
require('telescope').load_extension('harpoon')


require('Comment').setup()

-- terminal stuff
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

local Terminal = require('toggleterm.terminal').Terminal

local clippy = Terminal:new({ cmd = 'bacon clippy' })

function _clippy_toggle()
  clippy:toggle()
end

local broot = Terminal:new({ cmd = 'br'})

function _broot_toggle()
  broot:toggle()
end

local ncmpcpp = Terminal:new({ cmd = 'ncmpcpp'})

function _ncmpcpp_toggle()
  ncmpcpp:toggle()
end

local wikitui = Terminal:new({ cmd = 'wiki-tui'})

function _wikitui_toggle()
  wikitui:toggle()
end

local htop = Terminal:new({ cmd = 'htop'})

function _htop_toggle()
  htop:toggle()
end

local fish = Terminal:new({ cmd = 'fish'})

function _fish_toggle()
  fish:toggle()
end

local discordo = Terminal:new({ cmd = 'discordo run --token="NjI3MDE1OTc3MjMzNjc4MzM2.GLTl_y.sV_IUOJloLhHQs8qPD3yK3YztM-sIx4NANts7I"'})

function _discordo_toggle()
  discordo:toggle()
end
