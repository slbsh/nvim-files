" setup
hi clear

if exists("syntax on")
   syntax reset
endif

set t_Co=256
let g:colors_name = "brust"
set termguicolors

" vars
let s:bg=        "#24201d"  " background
let s:fg=        "#d4b66f"  " text
let s:fg2=       "#c3ac90"  " line numbers
let s:fg3=       "#b29d83"  " idk
let s:fg4=       "#a18e77"  " idk
let s:bg2=       "#3d2e2d"  " sidebar
let s:bg3=       "#794b44"  " statusline
let s:bg4=       "#5f5252"  " non text
let s:menus=     "#4f3524"
let s:keyword=   "#e3a30c"
let s:builtin=   "#de9114"
let s:const=     "#b64511"
let s:comment=   "#806e6e"
let s:func=      "#912121"
let s:str=       "#8a6813"
let s:type=      "#d97a0e"
let s:var=       "#d48600"
let s:warning=   "#ff0051"
let s:warning2=  "#ef2907"
let s:selection= "#3a2f1e"
let s:highvis=   "#d5c730"
let s:green=     "#708d2e"
let s:yellow=    "#f7ef00"

" the stuff
exe 'hi Ptrs guifg='s:highvis' gui=bold,italic'
exe 'hi Normal guifg='s:fg' guibg='s:bg
exe 'hi Cursor guifg='s:bg' guibg='s:fg
exe 'hi CursorLine  guibg='s:bg2
exe 'hi CursorLineNr guifg='s:str' guibg='s:bg
exe 'hi CursorColumn  guibg='s:bg2
exe 'hi ColorColumn  guibg='s:bg2
exe 'hi FoldColumn guifg='s:comment' guibg='s:bg2
exe 'hi SignColumn guifg='s:comment' guibg='s:bg2
exe 'hi LineNr guifg='s:fg' guibg='s:menus
exe 'hi CursorLineNr guifg='s:yellow' guibg='s:bg2
exe 'hi VertSplit guifg='s:fg3' guibg='s:bg3
exe 'hi MatchParen guifg='s:warning2'  gui=underline'
exe 'hi StatusLine guifg='s:fg2' guibg='s:bg2' gui=bold'
exe 'hi Pmenu guifg='s:fg' guibg='s:bg2
exe 'hi PmenuSel  guibg='s:bg3
exe 'hi IncSearch guifg='s:bg' guibg='s:keyword
exe 'hi Search   gui=underline'
exe 'hi Directory guifg='s:const
exe 'hi Folded guifg='s:fg4' guibg='s:bg
exe 'hi WildMenu guifg='s:str' guibg='s:bg
exe 'hi Visual guibg='s:selection

exe 'hi Boolean guifg='s:const
exe 'hi Character guifg='s:const
exe 'hi Comment guifg='s:comment
exe 'hi Conditional guifg='s:keyword
exe 'hi Constant guifg='s:const
exe 'hi Todo guibg='s:bg
exe 'hi Define guifg='s:keyword

exe 'hi DiffAdd guifg='s:green
exe 'hi DiffDelete guifg='s:const
exe 'hi DiffChange guifg='s:highvis
exe 'hi DiffText guifg='s:fg

exe 'hi ErrorMsg guifg='s:warning' guibg='s:bg2' gui=bold'
exe 'hi WarningMsg guifg='s:fg' guibg='s:warning2
exe 'hi Float guifg='s:const
exe 'hi Function guifg='s:func
exe 'hi Identifier guifg='s:fg
exe 'hi Keyword guifg='s:keyword'  gui=bold'
exe 'hi Label guifg='s:var
exe 'hi NonText guifg='s:bg4
exe 'hi Number guifg='s:const
exe 'hi Operator guifg='s:keyword
exe 'hi PreProc guifg='s:keyword
exe 'hi Special guifg='s:fg 
exe 'hi SpecialKey guifg='s:fg2' guibg='s:bg2
exe 'hi Statement guifg='s:keyword
exe 'hi StorageClass guifg='s:type'  gui=italic'
exe 'hi String guifg='s:str
exe 'hi Tag guifg='s:keyword
exe 'hi Title guifg='s:fg'  gui=bold'
exe 'hi Todo guifg='s:highvis'  gui=inverse,bold'
exe 'hi Type guifg='s:type
exe 'hi Underlined   gui=underline'

exe 'hi IlluminatedWordText gui=underline'

" better comments
exe 'hi ErrorComment gui=bold guifg='s:const
exe 'hi QuestComment gui=bold guifg='s:green
exe 'hi NoteComment  gui=bold guifg='s:highvis
" exe 'hi NormComment guifg='s:comment

" bg4
" func
" Neovim Terminal Mode
let g:terminal_color_0  = s:bg
let g:terminal_color_1  = s:warning
let g:terminal_color_2  = s:keyword
let g:terminal_color_3  = s:func
let g:terminal_color_4  = s:green
let g:terminal_color_5  = s:builtin
let g:terminal_color_6  = s:fg3
let g:terminal_color_7  = s:str
let g:terminal_color_8  = s:bg2
let g:terminal_color_9  = s:warning2
let g:terminal_color_10 = s:fg2
let g:terminal_color_11 = s:var
let g:terminal_color_12 = s:type
let g:terminal_color_13 = s:const
let g:terminal_color_14 = s:fg4
let g:terminal_color_15 = s:comment

" Javascript Highlighting
exe 'hi jsBuiltins guifg='s:builtin
exe 'hi jsFunction guifg='s:keyword' gui=bold'
exe 'hi jsGlobalObjects guifg='s:type
exe 'hi jsAssignmentExps guifg='s:var

" Html Highlighting
exe 'hi htmlLink guifg='s:var' gui=underline'
exe 'hi htmlStatement guifg='s:keyword
exe 'hi htmlSpecialTagName guifg='s:keyword

" Markdown Highlighting
exe 'hi mkdCode guifg='s:builtin

" custom syntax

