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
-- vim.opt.mouse        = ""

vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.g.mapleader        = " "
-- vim.g.&t_ZH            = "\e[3m"
-- vim.g.&t_ZR            = "\e[23m"
vim.g.smoothie_enabled = 1
vim.g.zig_fmt_autosave = 0


vim.cmd('colorscheme rust')


-- Imports
local HOME = os.getenv("HOME")

local files = vim.fn.systemlist(string.format('find %s/.config/nvim/ -maxdepth 1 -type f ! -name "init.lua"', HOME))
for _, file in pairs(files) do
   vim.cmd("luafile " .. file)
end


local files = vim.fn.systemlist(string.format('ls %s/.config/nvim/plugins/', HOME))
for _, file in ipairs(files) do
   vim.cmd(string.format("luafile %s/.config/nvim/plugins/%s", HOME, file))
end
