function __telescope()
   local t = require('telescope')
   t.setup({
      extensions = {
         fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
         }
      }
   })

   t.load_extension('fzf')
end


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

require("auto-indent").setup()

local Terminal = require('toggleterm.terminal').Terminal

local clippy = Terminal:new({ cmd = 'bacon clippy' })
function _clippy_toggle()
   clippy:toggle()
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

local glow = Terminal:new({ cmd = 'glow'})
function _glow_toggle()
   glow:toggle()
end


-- Man
function _man_prompt_toggle(args)
   local args = vim.fn.input('Page: ')

   if args ~= "" then
      Terminal:new({ cmd = 'man ' .. args }):toggle()
   end
end


-- Telnet
function _telnet_prompt_toggle(args)
   local args = vim.fn.input('Args: ')

   if args ~= "" then
      Terminal:new({ cmd = 'telnet ' .. args }):toggle()
   end
end
