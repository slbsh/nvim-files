vim.opt.background   = "dark"
vim.opt.completeopt  = {"noinsert", "menuone", "noselect"}
vim.opt.clipboard    = "unnamedplus"
vim.opt.cursorline   = true
vim.opt.number       = true
vim.opt.title        = true
vim.opt.wildmenu     = true
vim.opt.expandtab    = true
vim.opt.shiftwidth   = 3
vim.opt.tabstop      = 3
vim.opt.scrolloff    = 3
vim.opt.wrap         = false
vim.opt.compatible   = false
vim.opt.hlsearch     = false
vim.opt.autoread     = true
vim.opt.incsearch    = true
vim.opt.ignorecase   = true
vim.opt.smartcase    = true
vim.opt.showmatch    = true
vim.opt.showmode     = false
vim.opt.ruler        = false
vim.opt.laststatus   = 0
vim.opt.showcmd      = false
vim.opt.timeoutlen   = 700
vim.opt.list         = true
vim.opt.mouse        = ""

vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.g.mapleader        = " "
-- vim.g.&t_ZH            = "\e[3m"
-- vim.g.&t_ZR            = "\e[23m"
vim.g.smoothie_enabled = 1
vim.g.zig_fmt_autosave = 0


vim.cmd('colorscheme rust')


-- Imports
local imports = {
   "plugins.lua", "completions.lua", "appearance.lua",
   "utils.lua", "bettercomments.lua", "command.lua",
   "keymaps.lua", "cmp-ext.lua",
}

local HOME = os.getenv("HOME")
for _, file in pairs(imports) do
   vim.cmd(string.format('luafile %s/.config/nvim/%s', HOME, file))
end
