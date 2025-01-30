local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
   snippet = {
      expand = function(args)
         vim.snippet.expand(args.body)
      end,
   },

	formatting = {
		format = lspkind.cmp_format({
			maxwidth = { menu = 50, abbr = 50 },
			ellipsis_char = '..',
			mode = 'symbol',
			menu = {
				buffer = "ᵇᵘᶠ", 
				nvim_lsp = "ˡˢᵖ",
				calc = "ᶜᵃˡ",
				crates = "ᶜʳ",
				git = "ᵍᶦᵗ",
				path = "ᵖᵃᵗʰ",
				spell = "ˢᵖ",
				conventionalcommits = "ᶜᶜ",
				ext = "ᵉˣᵗ",
			}
		}),
	},

   mapping = cmp.mapping.preset.insert({      
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ['<S-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Down>'] = cmp.mapping.select_next_item(),
      ['<Up>'] = cmp.mapping.select_prev_item(),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = true}),
      
      ['<S-CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
   }),

   sources = {
		{ name = 'conventionalcommits' },
      { name = 'git' },
      { name = 'crates' },
      { name = 'calc' },
      { name = 'ext' },
      { name = 'path' }, 
      { name = 'buffer' },
      { name = 'spell' },
      { name = 'nvim_lsp' },
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
