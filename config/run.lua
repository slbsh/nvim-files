local uv = vim.loop

-- TODO: RunInteractive - no stdin from lines, instead reading user's input as stdin

local function run_async_print(last_line, content, args)
   local stdout = uv.new_pipe(false)
   local stderr = uv.new_pipe(false)
   local stdin  = uv.new_pipe(false)

   local args = vim.split(args, " ")
   local env = vim.env

   -- handle env args: :Run $VAR=value cmd
   while args[1]:sub(1, 1) == "$" do
      local arg = vim.split(args[1], "=")
      env[arg[1]:sub(2)] = arg[2]
      table.remove(args, 1)
   end

   local cmd = table.remove(args, 1)

   local handle, pid = uv.spawn(cmd, {
      args = args,
      stdio = {stdin, stdout, stderr},
   }, function(code, _)
      print(code)
      stdout:read_stop()
      stdout:close()
      stderr:read_stop()
      stderr:close()
   end)

   if not handle then
      print(pid)
      return
   end

   local function printdata(err, data)
      if not data then return end

      vim.schedule(function()
         local lines = vim.split(data, "\n")
         if lines[#lines] == "" then
            table.remove(lines)
         end

         vim.fn.append(last_line, lines)
         last_line = last_line + #lines
      end)
   end

   uv.write(stdin, content)
   uv.read_start(stdout, printdata)
   uv.read_start(stderr, printdata)

   uv.shutdown(stdin, function() 
      uv.close(handle)
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
