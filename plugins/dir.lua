vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrw_gitignore = 1

vim.api.nvim_create_autocmd("VimEnter", {
   callback = function()
      if vim.fn.isdirectory(vim.fn.expand('%')) == 1 then
         vim.cmd('silent! bd')
         vim.cmd('Xplr ' .. vim.fn.expand('%'))
      end
   end
})
