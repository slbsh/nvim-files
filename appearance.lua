require('lualine').setup {
    options = {
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

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}

require('illuminate').configure({
   delay = 10,
   under_cursor = false,
})
