local uv = vim.loop

-- TODO: RunInteractive - no stdin from lines, instead reading user's input as stdin

local processes = {}

vim.api.nvim_create_user_command("Abort", function(opts)
   for pid, handle in pairs(processes) do
      uv.process_kill(handle)
   end
end, {})


vim.api.nvim_create_user_command("Run", function(opts)
   local content = table.concat(vim.fn.getline(opts.line1, opts.line2), "\n")

   local stdout = uv.new_pipe(false)
   local stderr = uv.new_pipe(false)
   local stdin  = uv.new_pipe(false)

   local args = vim.split(opts.args, " ")
   local env = vim.env

   -- handle env args: :Run $VAR=value cmd
   while args[1]:sub(1, 1) == "$" do
      local arg = vim.split(args[1], "=")
      env[arg[1]:sub(2)] = arg[2]
      table.remove(args, 1)
   end

   local cmd = table.remove(args, 1)

   local tmp_pid = 0
   local handle, pid = uv.spawn(cmd, {
      args = args,
      stdio = {stdin, stdout, stderr},
   }, function(_, signal)
      table.remove(processes, tmp_pid)
      print(signal)
      stdout:read_stop()
      stdout:close()
      stderr:read_stop()
      stderr:close()
   end)

   tmp_pid = pid
   processes[pid] = handle

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

         vim.fn.append(opts.line2, lines)
         opts.line2 = opts.line2 + #lines
      end)
   end

   uv.write(stdin, content)
   uv.read_start(stdout, printdata)
   uv.read_start(stderr, printdata)
   uv.shutdown(stdin)
end, { nargs = 1, range = true })

vim.api.nvim_create_user_command("RunTerm", function(opts)
   local content = table.concat(vim.fn.getline(opts.line1, opts.line2), "\n")
   vim.api.nvim_command("terminal " .. content)
end, { range = true })
