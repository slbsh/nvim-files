local keymap = {
   c = 'comment',

   ['<leader>'] = {':noh<CR>', 'clear'},
   t = {':ToggleTerm<CR>', 'terminal'},
   T = {':ToggleTermAll<CR>', 'terminal all'},

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
      p = {':bp<CR>', 'previous'},
      d = {':bd<CR>', 'delete'},
      D = {':bd!<CR>', 'force delete'},
      w = {':wa!<CR>', 'write all'}, 
   },

   f = {
      name = '+Files',
      t = {':Xplr<CR>', 'Xplr'},
      r = {':Telescope oldfiles<CR>', 'Recent'},
      h = {':Telescope harpoon marks<CR>', 'harpoon'},
      a = {':lua require("harpoon.mark").add_file()<CR>', 'save current'},
      e = {':lua require("harpoon.ui").toggle_quick_menu()<CR>', 'menu'},
      D = {':call delete(expand("%")) | bdelete!<CR>', 'delete'},
      w = {':Telescope live_grep<CR>', 'grep'},
      R = {':Rename ', 'rename'},
   },

   u = {
      name = '+Utils',
      C = {':Calendar<CR>', 'calendar'},
      c = {':lua _clippy_toggle()<CR>', 'clippy'},
      b = {':lua _broot_toggle()<CR>', 'broot'},
      n = {':lua _ncmpcpp_toggle()<CR>', 'ncmpcpp'},
      w = {':lua _wikitui_toggle()<CR>', 'wikitui'},
      h = {':lua _htop_toggle()<CR>', 'htop'},
      f = {':lua _fish_toggle()<CR>', 'fish'},
      d = {':lua _discordo_toggle()<CR>', 'discord'},
   },
}

require('whichkey_setup').register_keymap('leader', keymap, {noremap=true, silent=true})
