require('lualine').setup {
   options = {
      -- theme = 'gruvbox',
      component_separators = { left = '|', right = '|'},
      section_separators = { left = '', right = ''},
   },
   sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location', 'searchcount', 'selectioncount'}
   },
  tabline = {
      lualine_a = {'buffers'},
      lualine_z = {'tabs'},
   }
}

-- Git
require('gitsigns').setup {
   signs = {
      add = { text = " +" },
      change = { text = " ~" },
      delete = { text = " -" },
      topdelete = { text = " -" },
      changedelete = { text = " ~" },
      untracked = { text = " |" },
   },
   signs_staged = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "-" },
      topdelete = { text = "-" },
      changedelete = { text = "~" },
      untracked = { text = "|" },
   },
}
