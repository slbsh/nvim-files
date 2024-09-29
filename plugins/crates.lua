require('crates').setup({
   completion = { 
      crates = { 
         enabled = true,
         max_results = 8,
         min_chars = 3,
      },
      cmp = { enabled = true } 
   },
   popup = { autofocus = true },
})
