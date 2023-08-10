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
      ['`'] = cmp.mapping.confirm({ select = true }), 
   },

   sources = {
      { name = 'luasnip' },
      { name = 'path' }, 
      { name = 'buffer' },
      { name = 'crates' },
   },

   formatting = {
      menu = {
         border = 'rounded',
         shadow = true,
      },
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
