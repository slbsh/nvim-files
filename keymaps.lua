vim.cmd([[ command! -nargs=1 RenameFile lua _rename__file(<q-args>) ]])

-- this doesnt work
function renameFile(new_name)
  local current_buffer = vim.fn.bufname('%') -- Get the name of the current buffer's file
  if current_buffer == '' then
    print("buffer isn't a file")
    return
  end

  local cmd = 'mv ' .. current_buffer .. ' ' .. new_name
  vim.fn.system(cmd)
  vim.cmd('e ' .. new_name)
end

function toggle_wrap()
  if vim.api.nvim_get_option("wrap") then
    vim.api.nvim_set_option("wrap", false)
  else
    vim.api.nvim_set_option("wrap", true)
  end
end
-- spell check
vim.opt_local.spelllang = 'en_us'

function toggle_spell()
   if vim.opt_local.spell:get() then
      vim.opt_local.spell = false
   else
      vim.opt_local.spell = true
   end
end

local keymap = {
   c = 'comment',

   ['<leader>'] = {':noh<CR>', 'clear'},
   t = {':ToggleTerm<CR>', 'terminal'},
   T = {':ToggleTermAll<CR>', 'terminal all'},
   S = {':lua toggle_spell()<CR>', 'spell'},
   W = {':lua toggle_wrap()<CR>', 'wrap'},

   s = {
      name = '+Surround',
      d = 'delete surround',
      s = 'surround',
      S = 'surround line',
   },

   b = {
      name = '+Buffers',
      r = {'<Cmd>Telescope buffers<CR>', 'current'},
      n = {':bn<CR>', 'next'},
      N = {':enew<CR>', 'new'},
      p = {':bp<CR>', 'previous'},
      d = {':bd<CR>', 'delete'},
      D = {':bd!<CR>', 'force delete'},
      w = {':wa!<CR>', 'write all'}, 
   },

   f = {
      name = '+Files',
      t = {':Xplr %:p:h<CR>', 'Xplr'},
      r = {':Telescope oldfiles<CR>', 'Recent'},
      w = {':Telescope live_grep<CR>', 'grep'},
      f = {':Telescope find_files<CR>', 'find'},
      R = {':RenameFile<CR>', 'rename'},
   },

   a = {
      name = '+Applications',
      c = {':lua _clippy_toggle()<CR>', 'clippy'},
      b = {':lua _broot_toggle()<CR>', 'broot'},
      h = {':lua _htop_toggle()<CR>', 'htop'},
      n = {':lua _ncmpcpp_toggle()<CR>', 'ncmpcpp'},
      w = {':lua _wikitui_toggle()<CR>', 'wikitui'},
      f = {':lua _fish_toggle()<CR>', 'fish'},
      f = {':lua _glow_toggle()<CR>', 'glow'},
      m = {':ManPrompt<CR>', 'man'},
      t = {':Telnet<CR>', 'telnet'},
   },

   C = {
      name = '+Crates',
      v = {':lua require("crates").show_versions_popup()<CR>', 'version'},
      f = {':lua require("crates").show_features_popup()<CR>', 'features'},
      d = {':lua require("crates").show_dependencies_popup()<CR>', 'dependencies'},
      u = {':lua require("crates").upgrade_crate()<CR>', 'update'},
      U = {':lua require("crates").upgrade_all_crates()<CR>', 'update all'},
   },
}

require('whichkey_setup').register_keymap('leader', keymap, {noremap=true, silent=true})
