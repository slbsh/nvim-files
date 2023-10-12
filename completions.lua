-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
   snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },

   mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
      ['S-Tab'] = cmp.mapping.select_prev_item(),
   },

   sources = {
      { name = 'crates' },
      { name = 'calc' },
      { name = 'greek' },
      { name = 'luasnip' },
      { name = 'path' }, 
      { name = 'buffer' },
      { name = 'spell' },
   },

   window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
   },
})

cmp.setup.cmdline({ '/', '?' }, {
   mapping = cmp.mapping.preset.cmdline(),

   sources = {
      { name = 'buffer' }
   }
})

cmp.setup.cmdline(':', {
   mapping = cmp.mapping.preset.cmdline(),

   sources = cmp.config.sources({
      { name = 'path' }
   }, {
      { name = 'cmdline'}
   })
})

require('crates').setup()

-- spell check
vim.opt_local.spelllang = 'en_us'

function toggle_spell()
   if vim.opt_local.spell:get() then
      vim.opt_local.spell = false
   else
      vim.opt_local.spell = true
   end
end
