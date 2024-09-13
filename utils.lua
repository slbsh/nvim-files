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


local Terminal = require('toggleterm.terminal').Terminal

local clippy = Terminal:new({ cmd = 'bacon clippy' })
function _clippy_toggle()
   clippy:toggle()
end

local vimpc = Terminal:new({ cmd = 'vimpc'})
function _vimpc_toggle()
   vimpc:toggle()
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

local fish = Terminal:new({ cmd = 'fish'})
function _fish_toggle()
   fish:toggle()
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
