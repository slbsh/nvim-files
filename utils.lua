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

require('Comment').setup()
require('Comment.ft').hjson = '#%s'


local ps = require("persistence")
ps.setup()
vim.api.nvim_create_autocmd("VimEnter", { callback = ps.load })


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

--
-- man
function _man_prompt_toggle(args)
   local user_input = vim.fn.input('Page: ')

   if user_input ~= '' then
      Terminal:new({ cmd = 'man ' .. user_input }):toggle()
   end
end

vim.cmd([[ command! -nargs=* ManPrompt lua _man_prompt_toggle(<q-args>) ]])

--
-- telnet
function _telnet_prompt_toggle(args)
   local user_input = vim.fn.input('Page: ')

   if user_input ~= '' then
      Terminal:new({ cmd = 'telnet ' .. user_input }):toggle()
   end
end

vim.cmd([[ command! -nargs=* Telnet lua _telnet_prompt_toggle(<q-args>) ]])
