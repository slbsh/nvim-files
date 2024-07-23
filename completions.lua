-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
   snippet = {
      expand = function(args)
         vim.snippet.expand(args.body)
      end,
   },

   mapping = cmp.mapping.preset.insert({      
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ['<S-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Down>'] = cmp.mapping.select_next_item(),
      ['<Up>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = true}),
      
      ['<S-CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),

      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
   }),

   sources = {
      { name = 'crates' },
      { name = 'calc' },
      { name = 'greek' },
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

