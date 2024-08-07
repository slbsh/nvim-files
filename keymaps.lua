-- Toggles
function toggle_wrap()
  if vim.api.nvim_get_option("wrap") then
    vim.api.nvim_set_option("wrap", false)
  else
    vim.api.nvim_set_option("wrap", true)
  end
end

vim.opt_local.spelllang = 'en_us'
function toggle_spell()
   if vim.opt_local.spell:get() then
      vim.opt_local.spell = false
   else
      vim.opt_local.spell = true
   end
end



-- Formatting
local formatters = {
   [".rs"] = 'cargo fmt',
}

function format_buffer()
   local current_file = vim.api.nvim_buf_get_name(0)
   local extension = current_file:match("^.+(%..+)$")

   local fmt = formatters[extension]
   
   if not fmt then
      print("No formatter configured.")
      return
   end

   vim.cmd("silent!" .. fmt)
end

-- Git
function set_upstream()
   local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD")
   branch = string.gsub(branch, "\n", "")

   local out = vim.fn.system("git branch -u origin/" .. branch)
   vim.notify(out, "info")
end


function fetch_pull()
   vim.api.nvim_command("Git fetch")
   vim.api.nvim_command("Git pull")
end

-- Comment binds
vim.api.nvim_set_keymap('n', '<leader>c', 'gcc', {})
vim.api.nvim_set_keymap('v', '<leader>c', 'gc', {})
vim.api.nvim_set_keymap('n', '<leader>x', 'gcA', {})


-- Which Key
require('which-key').setup {
   triggers = {
      { "<auto>", mode = "nvxsot" },
   },
}

local c = require("crates")
require('which-key').add({
   mode = {"n", "v"},
   
   {"<leader>c", desc = "comment",         mode = "n"},
   {"<leader>c", desc = "comment",         mode = "v"},
   {"<leader>x", desc = "append comment",  mode = "n"},

   {"<leader><leader>", ":noh<CR>",               desc = "clear"},
   {"<leader>t",        ":ToggleTerm<CR>",        desc = "terminal"},
   {"<leader>W",        ":lua toggle_wrap()<CR>", desc = "wrap"},
   {"<leader>w",        "<C-w>w",                 desc = "next window"},


   -- Spell
   {"<leader>s", group = "Spell"},
   {"<leader>sS", toggle_spell, desc = "toggle"},
   {"<leader>ss", '1z=',        desc = "first"},
   {"<leader>sn", ']s',         desc = "next"},
   {"<leader>sN", ']S',         desc = "next bad"},
   {"<leader>sp", '[s',         desc = "prev"},
   {"<leader>sP", '[S',         desc = "prev bad"},
   {"<leader>sa", 'za',         desc = "add"},
   {"<leader>sA", 'zw',         desc = "add bad"},


   -- Git
   {"<leader>g", group = "Git"},
   {"<leader>gt", ":Gitsigns toggle_signs<CR>",              desc = 'toggle signs'},
   {"<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", desc = 'line blame'},
   {"<leader>gB", ":Gitsigns blame<CR>",                     desc = 'blame'},
   {"<leader>ga", ":Gitsigns stage_hunk<CR>",                desc = "stage hunk"},
   {"<leader>gu", ":Gitsigns undo_stage_hunk<CR>",           desc = "unstage hunk"},
   {"<leader>gA", ":Gitsigns stage_buffer<CR>",              desc = 'stage buffer'},
   {"<leader>gR", ":Gitsigns reset_buffer<CR>",              desc = 'reset buffer'},
   {"<leader>gi", ":Git init<CR>",                           desc = 'init'},
   {"<leader>gs", ":Git restore --staged %<CR>",             desc = 'restore staged'},
   {"<leader>gS", ":Git restore %<CR>",                      desc = 'restore'},
   {"<leader>gf", ":Git fetch<CR>",                          desc = 'fetch'},
   {"<leader>g.", ":Git add .<CR>",                          desc = 'add all'},
   {"<leader>gU", ":Git reset HEAD~1<CR>",                   desc = 'undo'},
   {"<leader>gg", ":Git<CR>",                                desc = 'info'},
   {"<leader>gL", ":Git log --oneline --graph<CR>",          desc = 'log'},
   {"<leader>g^", set_upstream,                              desc = 'set upstream'},
   {"<leader>gC", ":Git checkout ",                          desc = 'checkout'},
   {"<leader>gd", ":Git diff<CR>",                           desc = 'diff'},
   {"<leader>gD", ":Git difftool<CR>",                       desc = 'diff tool'},
   {"<leader>gF", ":Git add ",                               desc = 'add file'},
   {"<leader>g#", ":Git reflog<CR>",                         desc = 'reflog'},
   {"<leader>g@", ":Git show ",                              desc = 'show'},
   {"<leader>gh", ":Git help<CR>",                           desc = 'help'},
   {"<leader>g?", ":Git branch -v<CR>",                      desc = 'branch'},
   {"<leader>gm", ":Git merge ",                             desc = "merge"},

   {"<leader>gT", group = 'Stash'},
   {"<leader>gTs", ":Git stash<CR>",      desc = 'stash'},
   {"<leader>gTp", ":Git stash pop<CR>",  desc = 'pop'},
   {"<leader>gTd", ":Git stash drop<CR>", desc = 'drop'},

   {"<leader>gTl", ":Git stash list<CR>", desc = 'list'},
   {"<leader>gr", group = 'Rebase'},
   {"<leader>grc", ":Git rebase --continue<CR>", desc = 'continue'},
   {"<leader>gra", ":Git rebase --abort<CR>",    desc = 'abort'},
   {"<leader>grs", ":Git rebase --skip<CR>",     desc = 'skip'},

   {"<leader>gc", group = 'Commit'},
   {"<leader>gcc", ":Git commit<CR>",         desc = 'commit'},
   {"<leader>gca", ":Git commit -a<CR>",      desc = 'commit all'},
   {"<leader>gcA", ":Git commit --amend<CR>", desc = 'commit amend'},

   {"<leader>gp", group = 'Push'},
   {"<leader>gpp", ":Git push<CR>",                    desc = 'push'},
   {"<leader>gpf", ":Git push --force-with-lease<CR>", desc = 'push force (lease)'},
   {"<leader>gpF", ":Git push --force<CR>",            desc = 'push force'},

   {"<leader>gl", group = 'Pull'},
   {"<leader>gll", ":Git pull<CR>",             desc = 'pull'},
   {"<leader>glL", ":lua fetch_pull()<CR>",     desc = 'fetch pull'},
   {"<leader>glr", ":Git pull --rebase<CR>",    desc = 'pull rebase'},
   {"<leader>glm", ":Git pull --no-rebase<CR>", desc = 'pull merge'},
   {"<leader>glf", ":Git pull --ff-only<CR>",   desc = 'pull fast-forward'},

   {"<leader>g*", group = 'Remote'},
   {"<leader>g*r", ":Git remote -v<CR>", desc = 'remote'},
   {"<leader>g*a", ":Git remote add ",     desc = 'add remote'},
   {"<leader>g*d", ":Git remote remove ",  desc = 'remove remote'},
   {"<leader>g*u", ":Git remote update<CR>", desc = 'update remote'},

   {"<leader>g!", group = 'Cherry Pick'},
   {"<leader>g!c", ":Git cherry-pick ", desc = 'cherry-pick'},
   {"<leader>g!a", ":Git cherry-pick --abort<CR>", desc = 'abort'},
   {"<leader>g!c", ":Git cherry-pick --continue<CR>", desc = 'continue'},



   -- Buffers
   {"<leader>b", group = "Buffers"},
   {"<leader>br", ':Telescope buffers<CR>', desc = 'current'},
   {"<leader>bn", ':bn<CR>',                desc = 'next'},
   {"<leader>bN", ':enew<CR>',              desc = 'new'},
   {"<leader>bp", ':bp<CR>',                desc = 'previous'},
   {"<leader>bd", ':bd<CR>',                desc = 'delete'},
   {"<leader>bD", ':bd!<CR>',               desc = 'force delete'},
   {"<leader>bw", ':wa!<CR>',               desc = 'write all'}, 
   {"<leader>bf", format_buffer,            desc = 'format buffer'},


   -- Files
   {"<leader>f", group = "Files"},
   {"<leader>ft", ':Xplr %:p:h<CR>',                desc = 'Xplr'},
   {"<leader>fr", ':Telescope oldfiles<CR>',        desc = 'recent'},
   {"<leader>fg", ':Telescope live_grep<CR>',       desc = 'grep'},
   {"<leader>ff", ':Telescope find_files<CR>',      desc = 'find'},
   {"<leader>fc", ':Telescope command_history<CR>', desc = 'commands'},


   -- Files
   {"<leader>a", group = "Applications"},
   {"<leader>ac", _clippy_toggle,        desc = 'clippy'},
   {"<leader>ab", _broot_toggle,         desc = 'broot'},
   {"<leader>ah", _htop_toggle,          desc = 'htop'},
   {"<leader>an", _vimpc_toggle,         desc = 'vimpc'},
   {"<leader>aw", _wikitui_toggle,       desc = 'wikitui'},
   {"<leader>af", _fish_toggle,          desc = 'fish'},
   {"<leader>ag", _glow_toggle,          desc = 'glow'},
   {"<leader>am", _man_prompt_toggle,    desc = 'man'},
   {"<leader>at", _telnet_prompt_toggle, desc = 'telnet'},


   -- Crates
   {"<leader>C", group = "Crates"},
   {"<leader>Cv", c.show_versions_popup,     desc = 'version'},
   {"<leader>Cf", c.show_features_popup,     desc = 'features'},
   {"<leader>Cd", c.show_dependencies_popup, desc = 'dependencies'},
   {"<leader>Cu", c.upgrade_crate,           desc = 'update'},
   {"<leader>CU", c.upgrade_all_crates,      desc = 'update all'},
})
