local mode_color = function() 
	return string.format('LualineMode%s', vim.fn.mode())
end

require('lualine').setup {
	options = {
		-- theme = 'gruvbox',
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '', right = ''},
	},
	sections = {
		lualine_a = {{ 'mode', color = mode_color }},
		lualine_b = {'branch', 'diff'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location', 'searchcount', 'selectioncount'}
	},
	tabline = {
		lualine_a = {{ 'buffers', color = 'LualineBuffers' }},
	}
}
