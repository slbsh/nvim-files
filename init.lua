vim.opt.background   = "dark"
vim.opt.completeopt  = {"noinsert", "menuone", "noselect"}
vim.opt.clipboard    = "unnamedplus"
vim.opt.cursorline   = true
vim.opt.number       = true
vim.opt.title        = true
vim.opt.wildmenu     = true
vim.opt.expandtab    = false
vim.opt.shiftwidth   = 3
vim.opt.tabstop      = 3
vim.opt.scrolloff    = 3
vim.opt.wrap         = false
vim.opt.compatible   = false
vim.opt.hlsearch     = false
vim.opt.autoread     = true
vim.opt.incsearch    = true
vim.opt.ignorecase   = true
vim.opt.textwidth    = 0
vim.opt.wrapmargin   = 0
vim.opt.linebreak    = true
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
vim.opt.listchars:append "tab:▎ "
vim.opt.fillchars:append "eob: "

vim.o.swapfile          = false
vim.g.mapleader         = " "
vim.g.zig_fmt_autosave  = 0
vim.opt_local.spelllang = 'en_us'

vim.cmd('colorscheme mustard')

local HOME = os.getenv("HOME")

dofile(HOME .. "/.config/nvim/plugins.lua")

local function load_dir(dir)
	require("plenary.scandir").scan_dir(dir, { on_insert = function(file, _)
		if not file:match("%.lua$") then return end
		dofile(file)
	end})
end

load_dir(HOME .. "/.config/nvim/plugins")
load_dir(HOME .. "/.config/nvim/config")

-- hack to make all vertical splits horizontal :v
local run_cmd = vim.cmd
vim.cmd = setmetatable({}, {
	__call = function(_, cmd) 
		run_cmd(cmd:gsub("^vsplit", "split"))
	end,
	__index = run_cmd,
})
