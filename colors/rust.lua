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

-- vars
local BG =           "#24201d" -- background
local UI_BG =        "#3d2e2d" -- sidebar

local Gray =         "#806e6e" -- comments

local Orange =       "#e3a30c" -- keyword
local OrangeDark =   "#d97a0e"

local Green =        "#8aad38"
local GreenDark =    "#8a6813"

local Yellow =       "#f7ef00"
local YellowLight =  "#d4b66f" -- text
local YellowBright = "#d5c730"

local Red =          "#b64511"
local RedDark =      "#912121"

local Menus =        "#422f24" -- "#4f3524"
local Bar =          "#794b44" -- statusline
local Warn =         "#ef2907"

local fg2 =       "#c3ac90" -- line numbers

-- the stuff
hi('Normal',         { fg = YellowLight, bg = BG                                  })
hi('Cursor',         { fg = BG,          bg = YellowLight                         })
hi('TermCursor',     { link = 'Cursor'                                            })
hi('CursorLine',     {                   bg = UI_BG                               })
hi('CursorLineNr',   { fg = GreenDark,   bg = BG                                  })
hi('CursorColumn',   {                   bg = UI_BG                               })
hi('CursorLineNr',   { fg = Yellow,      bg = UI_BG                               })
hi('LineNr',         { fg = YellowLight, bg = Menus                               })
hi('ColorColumn',    {                   bg = UI_BG                               })
hi('FoldColumn',     { fg = Gray,        bg = UI_BG                               })
hi('SignColumn',     { fg = Gray,        bg = Menus                               })
hi('FloatBorder',    { bg =  BG                                                   })

hi('VertSplit',      { fg = "#b29d83",   bg = Bar                                 })
hi('MatchParen',     { fg = Warn,                     underline = true            })
hi('StatusLine',     { fg = fg2,         bg = UI_BG,  bold = true                 })
hi('StatusLineNC',   {                                reverse = true              })
hi('TabLine',        {                   bg = UI_BG,  underline = true            })
hi('TabLineFill',    {                                reverse = true              })
hi('TabLineSel',     {                                bold = true                 })

hi('Pmenu',          { fg = YellowLight, bg = BG                                  })
hi('PmenuSel',       {                   bg = Bar                                 })

hi('IncSearch',      { fg = BG,          bg = Orange                              })
hi('Search',         {                                underline = true            })
hi('Directory',      { fg = Red                                                   })
hi('Folded',         { fg = "#a18e77",   bg = BG                                  })
hi('WildMenu',       { fg = GreenDark,   bg = BG                                  })
hi('Visual',         {                   bg = "#3a2f1e"                           })
hi('Title',          { fg = YellowLight,              bold = true                 })

hi('WinSeparator',   { link = 'VertSplit'                                         })
hi('EndOfBuffer',    { link = 'NonText'                                           })
hi('LineNrAbove',    { link = 'LineNr'                                            })
hi('LineNrBelow',    { link = 'LineNr'                                            })
hi('QuickFixLine',   { link = 'Search'                                            })
hi('CursorLineSign', { link = 'SignColumn'                                        })
hi('CursorLineFold', { link = 'FoldColumn'                                        })
hi('CurSearch',      { link = 'Search'                                            })
hi('PmenuKind',      { link = 'Pmenu'                                             })
hi('PmenuKindSel',   { link = 'PmenuSel'                                          })
hi('PmenuExtra',     { link = 'Pmenu'                                             })
hi('PmenuExtraSel',  { link = 'PmenuSel'                                          })
hi('Substitute',     { link = 'Search'                                            })
hi('Whitespace',     { link = 'NonText'                                           })
hi('MsgSeparator',   { link = 'StatusLine'                                        })
hi('NormalFloat',    { link = 'Pmenu'                                             })
hi('FloatTitle',     { link = 'Title'                                             })
hi('FloatFooter',    { link = 'Title'                                             })
-- hi('FloatShadow',        { bg = 'Black', blend = 80                               })
-- hi('FloatShadowThrough', { bg = 'Black', blend = 100                              })

-- syntax stuff
hi('Boolean',        { fg = Red                                                   })
hi('Character',      { fg = Red                                                   })
hi('Comment',        { fg = Gray                                                  })
hi('Conditional',    { fg = Orange                                                })
hi('Constant',       { fg = Red                                                   })
hi('Float',          { fg = Red                                                   })
hi('Function',       { fg = RedDark                                               })
hi('Identifier',     { fg = YellowLight                                           })
hi('Keyword',        { fg = Orange,                   bold = true                 })
hi('Label',          { fg = "#d48600"                                             })
hi('Define',         { fg = Orange                                                })
hi('Number',         { fg = Red                                                   })
hi('Operator',       { fg = Orange                                                })
hi('PreProc',        { fg = Orange                                                })
hi('Special',        { fg = YellowLight                                           })
hi('SpecialKey',     { fg = fg2,         bg = UI_BG                               })
hi('Statement',      { fg = Orange                                                })
hi('StorageClass',   { fg = OrangeDark,               italic = true               })
hi('String',         { fg = GreenDark                                             })
hi('Tag',            { fg = Orange                                                })
hi('Type',           { fg = OrangeDark                                            })
hi('Repeat',         { link = 'Statement'                                         })
hi('Exception',      { link = 'Statement'                                         })
hi('Include',        { link = 'PreProc'                                           })
hi('Macro',          { link = 'PreProc'                                           })
hi('PreCondit',      { link = 'PreProc'                                           })
hi('Structure',      { link = 'Type'                                              })
hi('Typedef',        { link = 'Type'                                              })
hi('SpecialChar',    { link = 'Special'                                           })
hi('Delimiter',      { link = 'Special'                                           })
hi('SpecialComment', { link = 'Special'                                           })
hi('Debug',          { link = 'Special'                                           })

-- nvimy Syntax Stuff
hi('@variable',      { fg = YellowLight                                           })

-- git
hi('DiffAdd',        { fg = Green,       bg = Menus                               })
hi('DiffDelete',     { fg = Red,         bg = Menus                               })
hi('DiffChange',     { fg = YellowBright,bg = Menus                               })
hi('Added',          { fg = Green,       bg = Menus                               })
hi('Removed',        { fg = Red,         bg = Menus                               })
hi('Changed',        { fg = YellowBright,bg = Menus                               })
hi('DiffText',       { fg = YellowLight                                           })
hi('GitSignsStagedAdd',   { fg = Green,       bg = Menus, bold = true             })
hi('GitSignsStagedDelete',{ fg = Red,         bg = Menus, bold = true             })
hi('GitSignsStagedChange',{ fg = YellowBright,bg = Menus, bold = true             })

-- spell
hi('SpellBad',       { sp = Red,                      undercurl = true            })
hi('SpellCap',       { sp = Orange,                   undercurl = true            })
hi('SpellLocal',     { sp = OrangeDark,               undercurl = true            })
hi('SpellRare',      { sp = Gray,                     undercurl = true            })


hi('ErrorMsg',       { fg = Red,         bg = UI_BG,  bold = true                 })
hi('WarningMsg',     { fg = YellowLight, bg = Warn                                })
hi('Todo',           { fg = YellowBright,             bold = true, reverse = true })
hi('Question',       { fg = Green,                    bold = true, reverse = true })
hi('Error',          { fg = Red,                      bold = true, reverse = true })
hi('NonText',        { fg = "#5f5252"                                             })
hi('Underlined',     {                                underline = true            })

-- Illuminate
hi('IlluminatedWordText', {                           underline = true            })

-- Better Comments
hi('ErrorComment',   { fg = Red,                      bold = true                 })
hi('QuestComment',   { fg = Green,                    bold = true                 })
hi('NoteComment',    { fg = YellowBright,             bold = true                 })
