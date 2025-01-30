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

vim.api.nvim_set_keymap('n', '<M-1>', 
	':LualineBuffersJump! 1<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-2>', 
	':LualineBuffersJump! 2<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-3>', 
	':LualineBuffersJump! 3<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-4>', 
	':LualineBuffersJump! 4<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-5>', 
	':LualineBuffersJump! 5<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-6>', 
	':LualineBuffersJump! 6<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-7>', 
	':LualineBuffersJump! 7<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-8>', 
	':LualineBuffersJump! 8<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-9>', 
	':LualineBuffersJump! 9<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-0>', 
	':LualineBuffersJump! 10<CR>',
	{ noremap = true, silent = true })
