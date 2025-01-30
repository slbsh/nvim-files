-- setup
vim.cmd.highlight('clear')
vim.g.colors_name = 'rust'
vim.o.termguicolors = true

local hi = function(name, val)
   val.force = true
   val.cterm = {}
   vim.api.nvim_set_hl(0, name, val)
end

-- set t_Co=256

local Fg   = "#d7c17e"
local Bg0  = "#24231e"
local Bg1  = "#38352e"
local Bg2  = "#514d43"

local OrangeGreen = "#92730c"
local OrangeDim   = "#c77905"
local Orange      = "#f2a40d"
local OrangeLit   = "#f0c242"

local GreenDim    = "#749028"
local Green       = "#8dab2b"
local GreenLit    = "#a5ba3b"

local Yellow      = "#f5e20a"
local YellowLit   = "#f8e853"

local RedDim      = "#a4371e"
local Red         = "#cc4519"
local RedLit      = "#ee4c2b"

local GrayDim     = "#6b6757"
local Gray        = "#8d8572"
local GrayLit     = "#a39d8f"

local BlueDim     = "#527689"
local Blue        = "#6385a1"
local BlueLit     = "#799eaf"

-- the stuff
hi('Normal',         { fg = Fg,          bg = Bg0                                })
hi('Cursor',         { fg = Bg0,          bg = Fg                                })
hi('TermCursor',     { link = 'Cursor'                                          })
hi('CursorLine',     {                   bg = Bg1                               })
hi('CursorLineNr',   { fg = GreenDim,    bg = Bg0                                })
hi('CursorColumn',   {                   bg = Bg1                               })
hi('CursorLineNr',   { fg = Yellow,      bg = Bg1                               })
hi('LineNr',         { fg = Fg,          bg = Bg1                               })
hi('ColorColumn',    {                   bg = Bg1                               })
hi('FoldColumn',     { fg = Gray,        bg = Bg1                               })
hi('SignColumn',     { fg = Gray,        bg = Bg1                               })
hi('FloatBorder',    {                   bg = Bg0                                })

hi('VertSplit',      { fg = "#b29d83",   bg = Bg1                               })
hi('MatchParen',     { fg = RedLit,                 underline = true            })
hi('StatusLine',     { fg = Fg,          bg = Bg1,  bold = true                 })
hi('StatusLineNC',   { fg = Fg,          bg = GrayDim,                          })
hi('TabLine',        {                   bg = Bg1,  underline = true            })
hi('TabLineFill',    {                              reverse = true              })
hi('TabLineSel',     { fg = Fg,                     bold = true                 })

hi('Pmenu',          { fg = Fg,          bg = Bg0                                })
hi('PmenuSel',       {                   bg = GrayDim                           })

hi('IncSearch',      { fg = Bg0,         bg = OrangeLit,                        })
hi('Search',         {                              underline = true            })
hi('Directory',      { fg = Red                                                 })
hi('Folded',         { fg = "#a18e77",   bg = Bg0                                })
hi('WildMenu',       { fg = GreenDim,    bg = Bg0                                })
hi('Visual',         {                   bg = Bg2                           })
hi('Title',          { fg = Fg,                     bold = true                 })

hi('WinSeparator',   { link = 'VertSplit'                                       })
hi('EndOfBuffer',    { link = 'NonText'                                         })
hi('LineNrAbove',    { link = 'LineNr'                                          })
hi('LineNrBelow',    { link = 'LineNr'                                          })
hi('QuickFixLine',   { link = 'Search'                                          })
hi('CursorLineSign', { link = 'SignColumn'                                      })
hi('CursorLineFold', { link = 'FoldColumn'                                      })
hi('CurSearch',      { link = 'Search'                                          })
hi('PmenuKind',      { link = 'Pmenu'                                           })
hi('PmenuKindSel',   { link = 'PmenuSel'                                        })
hi('PmenuExtra',     { link = 'Pmenu'                                           })
hi('PmenuExtraSel',  { link = 'PmenuSel'                                        })
hi('Substitute',     { link = 'Search'                                          })
hi('Whitespace',     { link = 'NonText'                                         })
hi('MsgSeparator',   { link = 'StatusLine'                                      })
hi('NormalFloat',    { link = 'Pmenu'                                           })
hi('FloatTitle',     { link = 'Title'                                           })
hi('FloatFooter',    { link = 'Title'                                           })
-- hi('FloatShadow',        { bg = 'Black', blend = 80                               })
-- hi('FloatShadowThrough', { bg = 'Black', blend = 100                              })

hi('LualineModen',   { fg = Bg1,     bg = Fg,       bold = true                 })
hi('LualineModei',   { fg = Bg1,     bg = Green,    bold = true                 })
hi('LualineModev',   { fg = Bg1,     bg = Orange,   bold = true                 })
hi('LualineModeV',   { fg = Bg1,     bg = Orange,   bold = true                 })
hi('LualineModec',   { fg = Bg1,     bg = Yellow,   bold = true                 })
hi('LualineModeR',   { fg = Bg1,     bg = Red,      bold = true                 })
hi('LualineBuffers', { fg = GrayLit, bg = GrayDim,  bold = true                 })

-- syntax stuff
hi('Boolean',        { fg = Red                                                 })
hi('Character',      { fg = Red                                                 })
hi('Comment',        { fg = Gray                                                })
hi('Conditional',    { fg = OrangeLit,                                          })
hi('Constant',       { fg = Red                                                 })
hi('Float',          { fg = Red                                                 })
hi('Function',       { fg = RedDim                                              })
hi('Identifier',     { fg = Fg                                                  })
hi('Keyword',        { fg = OrangeLit,               bold = true                })
hi('Label',          { fg = Orange,                                             })
hi('Define',         { fg = OrangeLit,                                          })
hi('Number',         { fg = Red                                                 })
hi('Operator',       { fg = OrangeLit,                                          })
hi('PreProc',        { fg = OrangeLit,                                          })
hi('Special',        { fg = Fg                                                  })
hi('SpecialKey',     { fg = fg2,         bg = Bg1                               })
hi('Statement',      { fg = OrangeLit,                                          })
hi('StorageClass',   { fg = OrangeDim,               italic = true              })
hi('String',         { fg = OrangeGreen,                                          })
hi('Tag',            { fg = OrangeLit,                                          })
hi('Type',           { fg = OrangeDim                                           })
hi('Repeat',         { link = 'Statement'                                       })
hi('Exception',      { link = 'Statement'                                       })
hi('Include',        { link = 'PreProc'                                         })
hi('Macro',          { link = 'PreProc'                                         })
hi('PreCondit',      { link = 'PreProc'                                         })
hi('Structure',      { link = 'Type'                                            })
hi('Typedef',        { link = 'Type'                                            })
hi('SpecialChar',    { link = 'Special'                                         })
hi('Delimiter',      { link = 'Special'                                         })
hi('SpecialComment', { link = 'Special'                                         })
hi('Debug',          { link = 'Special'                                         })

-- nvimy Syntax Stuff
hi('@variable',      { fg = Fg                                                  })

-- git
hi('DiffAdd',        { fg = Green,       bg = Bg1                               })
hi('DiffDelete',     { fg = Red,         bg = Bg1                               })
hi('DiffChange',     { fg = YellowLit,   bg = Bg1                               })
hi('Added',          { fg = Green,       bg = Bg1                               })
hi('Removed',        { fg = Red,         bg = Bg1                               })
hi('Changed',        { fg = YellowLit,   bg = Bg1                               })
hi('DiffText',       { fg = Fg                                                  })
hi('GitSignsStagedAdd',   { fg = Green,       bg = Bg1, bold = true             })
hi('GitSignsStagedDelete',{ fg = Red,         bg = Bg1, bold = true             })
hi('GitSignsStagedChange',{ fg = YellowLit,   bg = Bg1, bold = true             })

-- spell
hi('SpellBad',       { sp = Red,                      undercurl = true          })
hi('SpellCap',       { sp = OrangeLit,                undercurl = true          })
hi('SpellLocal',     { sp = OrangeDim,                undercurl = true          })
hi('SpellRare',      { sp = Gray,                     undercurl = true          })


hi('ErrorMsg',       { fg = Red,         bg = Bg1,  bold = true, reverse = true })
hi('WarningMsg',     { fg = Yellow,      bg = Bg1,                              })
hi('Todo',           { fg = YellowLit,              bold = true, reverse = true })
hi('Question',       { fg = Green,                  bold = true, reverse = true })
hi('Error',          { fg = Red,                    bold = true, reverse = true })
hi('NonText',        { fg = GrayDim,                                            })
hi('Underlined',     {                              underline = true            })

-- Illuminate
hi('IlluminatedWordText', {                         underline = true            })

-- Better Comments
hi('ErrorComment',   { fg = Red,                    bold = true                 })
hi('QuestComment',   { fg = Green,                  bold = true                 })
hi('NoteComment',    { fg = YellowLit,              bold = true                 })
