local source = {}

source.new = function()
  local self = setmetatable({}, { __index = source })
  self.commit_items = nil
  self.insert_items = nil
  return self
end

source.get_trigger_characters = function()
  return { ":" }
end

source.get_keyword_pattern = function()
  return [=[\%(\s\|^\)\zs:[[:alnum:]_\-\+]*:\?]=]
end

source.complete = function(self, params, callback)
  -- Avoid unexpected completion.
  if not vim.regex(self.get_keyword_pattern() .. "$"):match_str(params.context.cursor_before_line) then
    return callback()
  end

  if self:option(params).insert then
    if not self.insert_items then
      self.insert_items = vim.tbl_map(function(item)
        item.word = nil
        return item
      end, source.items() 
    )
    end
    callback(self.insert_items)
  else
    if not self.commit_items then
      self.commit_items = source.items()
    end
    callback(self.commit_items)
  end
end

source.option = function(_, params)
  return vim.tbl_extend("force", {
    insert = false,
  }, params.option)
end


source.items = function()
   local map = {
      -- Greek
      alpha   = "α", Alpha   = "Α",
      beta    = "β", Beta    = "Β",
      gamma   = "γ", Gamma   = "Γ",
      delta   = "δ", Delta   = "Δ",
      epsilon = "ε", Epsilon = "Ε",
      zeta    = "ζ", Zeta    = "Ζ",
      eta     = "η", Eta     = "Η",
      theta   = "θ", Theta   = "Θ",
      iota    = "ι", Iota    = "Ι",
      kappa   = "κ", Kappa   = "Κ",
      lambda  = "λ", Lambda  = "Λ",
      mu      = "μ", Mu      = "Μ",
      nu      = "ν", Nu      = "Ν",
      xi      = "ξ", Xi      = "Ξ",
      omicron = "ο", Omicron = "Ο",
      pi      = "π", Pi      = "Π",
      rho     = "ρ", Rho     = "Ρ",
      sigma   = "σ", Sigma   = "Σ",
      tau     = "τ", Tau     = "Τ",
      upsilon = "υ", Upsilon = "Υ",
      phi     = "Φ", Phi     = "Φ",
      chi     = "χ", Chi     = "Χ",
      psi     = "ψ", Psi     = "Ψ",
      omega   = "ω", Omega   = "Ω",

      -- German
      oumlaut = "ö", Oumlaut = "Ö",
      aumlaut = "ä", Aumlaut = "Ä",
      uumlaut = "ü", Uumlaut = "Ü",
      sz      = "ẞ", Sz      = "ß",

      aleph   = "ℵ", bet    = "ℶ",

      -- Arrows
      leftarrow  = "←", Leftarrow  = "⇐",
      rightarrow = "→", Rightarrow = "⇒",
      uparrow    = "↑", Uparrow    = "⇑",
      downarrow  = "↓", Downarrow  = "⇓",

      -- Math
      times     = "×", divide   = "÷",
      leq       = "≤", geq      = "≥",
      neq       = "≠", approx   = "≈",
      infty     = "∞", forall   = "∀",
      exists    = "∃", empty    = "∅",
      notin     = "∉", subset   = "⊂",
      supset    = "⊃", cup      = "∪",
      cap       = "∩", in_      = "∈",
      notsubset = "⊄", 

      f         = "ƒ", hbar = "ℏ",

      lfloor    = "⌊", rfloor   = "⌋",
      lceil     = "⌈", rceil    = "⌉",
      langle    = "⟨", rangle   = "⟩",

      not_      = "¬", and_     = "∧",
      or_       = "∨", implies  = "⇒",
      iff       = "⇔",
      bot       = "⊥", top      = "⊤",
      vdash     = "⊢", dashv    = "⊣",

      prime     = "′", integral = "∫",


      -- APL
      _conj_plus = "+", _neg_minus = "−",
      _dir_mul   = "×", _recip_div = "÷",
      _magni_res = "|", _floor_min = "⌊",
      _ceil_max  = "⌈", _exp_power = "*",
      _nat_log   = "⍟", _pit_circl = "○",
      _fact_binm = "!", _not       = "~",
      _roll      = "?", _type      = "∊",
      _and       = "∧", _or        = "∨",
      _nand      = "⍲", _nor       = "⍱",
      _less      = "<", _leq       = "≤",
      _eq        = "=", _geq       = "≥",
      _greater   = ">", _neq       = "≠",

   }

   local items = {}

   for key, value in pairs(map) do
      table.insert(items, {
         word       = string.format(":%s:", key),
         label      = string.format(":%s %s:", value, key),
         insertText = value,
         filterText = string.format(":%s:", key),
      })
   end
   return items

end

require('cmp').register_source('ext', source.new())
