local commands = {
   Q = "q",
   W = "w",
   Wq = "wq",
   WQ = "wq",
   O = "o",
   E = "e",
}

for alias, cmd in pairs(commands) do
   vim.api.nvim_create_user_command(alias, cmd, {})
end


-- Buffer switching
function switch_buffer(num)
   local ls = vim.split(vim.api.nvim_exec("ls", true), '\n', {})
   local buffers = {}

   for _, buf in pairs(ls) do
      table.insert(buffers, string.match(buf, "%S+"))
   end

   if #buffers >= num then
      vim.cmd(":b " .. buffers[num])
   end
end

for i = 1, 9 do
   vim.api.nvim_set_keymap('n', 
      string.format('<M-%d>', i),
      string.format(':lua switch_buffer(%d)<CR>', i),
      { noremap = true, silent = true }
   )
end
