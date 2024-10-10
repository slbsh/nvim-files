local uv = vim.loop

local function run_async_print(last_line, content, args)
   local stdout = uv.new_pipe(false)
   local stdin = uv.new_pipe(false)

   local args = vim.split(args, " ")
   local cmd = table.remove(args, 1)

   local handle, pid = uv.spawn(cmd, {
      args = args,
      stdio = {stdin, stdout, nil},
   }, function(code, _)
      print(code)
      stdout:close()
   end)

   if not handle then
      print(pid)
      return
   end

   uv.write(stdin, content, function(err) stdin:close() end)
   uv.read_start(stdout, function(err, data)
      if not data then return end

      vim.schedule(function()
         local lines = vim.split(data, "\n")
         if lines[#lines] == "" then
            table.remove(lines)
         end

         vim.fn.append(last_line, lines)
         last_line = last_line + #lines
      end)
   end)
end

vim.api.nvim_create_user_command("Run", function(opts)
   local content = table.concat(vim.fn.getline(opts.line1, opts.line2), "\n")
   run_async_print(opts.line2, content, opts.args)
end, { nargs = 1, range = true })

vim.api.nvim_create_user_command("RunBuf", function(opts)
   local content = table.concat(vim.fn.getbufline("%", 1, "$"), "\n")
   run_async_print(vim.fn.line("$"), content, opts.args)
end, { nargs = 1 })
