local Terminal = require('toggleterm.terminal').Terminal

function new_term(cmd)
   local term = Terminal:new({ cmd = cmd })
   return function() 
      term:toggle() 
   end
end

function new_prompt_term(cmd)
   return function()
      local args = vim.fn.input('Args: ')

      if args ~= "" then
         Terminal:new({ cmd = cmd .. ' ' .. args }):toggle()
      end
   end
end
