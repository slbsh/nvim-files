-- Util
function prompt(prompt, cmd)
   vim.api.nvim_command(cmd .. vim.fn.input(prompt))
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

-- Crates
function crates(field)
   return function()
      require('crates')[field]()
   end
end

-- Which Key
require('which-key').setup {
   triggers = { { "<auto>", mode = "nvxsot" } },
}

require('which-key').add({
   mode = {"n", "v"},

   {"<leader>c", desc = "comment",         mode = "n"},
   {"<leader>c", desc = "comment",         mode = "v"},
   {"<leader>x", desc = "append comment",  mode = "n"},

   {"<leader><leader>", ":noh<CR>",            desc = "clear"},
   {"<leader>t",     ":ToggleTerm<CR>",        desc = "toggleterm"},
   {"<leader><C-t>", ":terminal<CR>",          desc = "terminal (empty)"},
   {"<leader>T",     ":RunTerm<CR>",           desc = "terminal"},
   {"<leader>W",     ":lua vim.wo.wrap = not vim.wo.wrap<CR>", desc = "wrap"},
   {"<leader>w",     "<C-w>w",                 desc = "next window"},
	{"<leader>p",     ":lua require('wrapping-paper').wrap_line()<CR>",  desc = "wrap line"},


	-- lsp ugh
	{"<leader>j", group = "LSP"},
	{"<leader>ju", ":lua vim.lsp.buf.definition()<CR>",  desc = "goto def"},
	{"<leader>jU", ":lua vim.lsp.buf.declaration()<CR>", desc = "goto decl"},
	{"<leader>jj", ":lua vim.lsp.buf.hover()<CR>",       desc = "doc hover"},
	{"<leader>jn", ":lua vim.lsp.buf.rename()<CR>",      desc = "rename"},
	-- {"<leader>jM", ":lua require('ferris.methods.expand_macro')()<CR>", desc = "expand macro"},
	-- {"<leader>jm", ":lua require('ferris.methods.view_memory_layout')()<CR>", desc = "mem layout"},
	-- {"<leader>jH", ":lua require('ferris.methods.view_hir')()<CR>", desc = "hir"},
	-- {"<leader>jh", ":lua require('ferris.methods.view_mir')()<CR>", desc = "mir"},

   -- Spell
   {"<leader>s", group = "Spell"},
   {"<leader>sS", ":lua vim.opt_local.spell = not vim.opt_local.spell:get()<CR>", desc = "toggle"},
   {"<leader>ss", '1z=',        desc = "first"},
   {"<leader>sn", ']s',         desc = "next"},
   {"<leader>sN", ']S',         desc = "next bad"},
   {"<leader>sp", '[s',         desc = "prev"},
   {"<leader>sP", '[S',         desc = "prev bad"},
   {"<leader>sa", 'za',         desc = "add"},
   {"<leader>sA", 'zw',         desc = "add bad"},


   -- Git
   {"<leader>g", group = "Git"},
   {"<leader>gb", ":Gitsigns toggle_current_line_blame<CR>",   desc = 'line blame'},
   {"<leader>gB", ":Gitsigns blame<CR>",                       desc = 'blame'},
   {"<leader>ga", ":Gitsigns stage_hunk<CR>",                  desc = "stage hunk"},
   {"<leader>gz", ":Gitsigns reset_hunk<CR>",                  desc = "reset hunk"},
   {"<leader>gu", ":Gitsigns undo_stage_hunk<CR>",             desc = "unstage hunk"},
   {"<leader>gh", ":Gitsigns preview_hunk_inline<CR>",         desc = 'preview hunk'},
   {"<leader>gA", ":Gitsigns stage_buffer<CR>",                desc = 'stage buffer'},
   {"<leader>gR", ":Gitsigns reset_buffer<CR>",                desc = 'reset buffer'},
   {"<leader>gd", ":Gitsigns diffthis<CR>",                    desc = 'diff'},
	{"<leader>gw", ":Gitsigns toggle_word_diff<CR>",            desc = 'word diff'},
   {"<leader>gi", ":Git init<CR>",                             desc = 'init'},
   {"<leader>gs", ":Git restore --staged %<CR>",               desc = 'restore staged'},
   {"<leader>gS", ":Git restore %<CR>",                        desc = 'restore'},
   {"<leader>gf", ":Git reflog expire --expire=now --all<CR>", desc = 'expire'},
   {"<leader>gF", ":Git reset --hard origin/master<CR>",       desc = 'fuckit'},
   {"<leader>g.", ":Git add .<CR>",                            desc = 'add all'},
   {"<leader>gU", ":Git reset HEAD~1<CR>",                     desc = 'undo'},
   {"<leader>gg", ":Git<CR>",                                  desc = 'info'},
   {"<leader>gL", ":Git log --oneline --graph<CR>",            desc = 'log'},
   {"<leader>g^", set_upstream,                                desc = 'set upstream'},
   {"<leader>gC", ":Git checkout ",                            desc = 'checkout'},
   {"<leader>gD", ":Git difftool<CR>",                         desc = 'diff tool'},
   {"<leader>g#", ":Git reflog<CR>",                           desc = 'reflog'},
   {"<leader>g@", ":lua prompt('Show: ', 'Git show ')",        desc = 'show'},
   {"<leader>g?", ":Git branch -v<CR>",                        desc = 'branch'},
   {"<leader>gm", ":lua prompt('Merge: ', 'Git merge ')",      desc = "merge"},

   {"<leader>gt", group = 'Stash'},
   {"<leader>gts", ":Git stash<CR>",      desc = 'stash'},
   {"<leader>gtp", ":Git stash pop<CR>",  desc = 'pop'},
   {"<leader>gtd", ":Git stash drop<CR>", desc = 'drop'},
   {"<leader>gtl", ":Git stash list<CR>", desc = 'list'},

   {"<leader>gr", group = 'Rebase'},
   {"<leader>grc", ":Git rebase --continue<CR>", desc = 'continue'},
   {"<leader>gra", ":Git rebase --abort<CR>",    desc = 'abort'},
   {"<leader>grs", ":Git rebase --skip<CR>",     desc = 'skip'},
   {"<leader>grr", ":Git reset HEAD^ %:p<CR>",   desc = 'go back'},
   {"<leader>grR", ":Git reset HEAD^ .<CR>",     desc = 'go back all'},

   {"<leader>gc", group = 'Commit'},
   {"<leader>gcc", ":Git commit<CR>",         desc = 'commit'},
   {"<leader>gca", ":Git commit -a<CR>",      desc = 'commit all'},
   {"<leader>gcA", ":Git commit --amend<CR>", desc = 'commit amend'},

   {"<leader>gp", group = 'Push'},
   {"<leader>gpp", ":Git push<CR>",                    desc = 'push'},
   {"<leader>gpf", ":Git push --force-with-lease<CR>", desc = 'push force (lease)'},
   {"<leader>gpF", ":Git push --force<CR>",            desc = 'push force'},

   {"<leader>gl", group = 'Pull'},
   {"<leader>glf", ":Git fetch<CR>",            desc = 'fetch'},
   {"<leader>gll", ":Git pull<CR>",             desc = 'pull'},
   {"<leader>glL", fetch_pull,                  desc = 'fetch pull'},
   {"<leader>glr", ":Git pull --rebase<CR>",    desc = 'pull rebase'},
   {"<leader>glm", ":Git pull --no-rebase<CR>", desc = 'pull merge'},
   {"<leader>glf", ":Git pull --ff-only<CR>",   desc = 'pull fast-forward'},

   {"<leader>g*", group = 'Remote'},
   {"<leader>g*r", ":Git remote -v<CR>", desc = 'remote'},
   {"<leader>g*a", ":lua prompt('URL: ', 'Git remote add ')", desc = 'add remote'},
   {"<leader>g*d", ":lua prompt('URL: ', 'Git remote remove ')", desc = 'remove remote'},
   {"<leader>g*u", ":Git remote update<CR>", desc = 'update remote'},



   -- Buffers
   {"<leader>b", group = "Buffers"},
   {"<leader>bf", ':Telescope buffers<CR>', desc = 'telescope'},
   {"<leader>bn", ':bn<CR>',                desc = 'next'},
   {"<leader>bN", ':enew<CR>',              desc = 'new'},
   {"<leader>bp", ':bp<CR>',                desc = 'previous'},
   {"<leader>bd", ':bd<CR>',                desc = 'delete'},
   {"<leader>bD", ':bd!<CR>',               desc = 'force delete'},
   {"<leader>bw", ':wa!<CR>',               desc = 'write all'}, 


   -- Files
   {"<leader>f", group = "Files"},
   {"<leader>ft", ':Xplr %:p:h<CR>',                desc = 'Xplr'},
   {"<leader>fr", ':Telescope oldfiles<CR>',        desc = 'recent'},
   {"<leader>fg", ':Telescope live_grep<CR>',       desc = 'grep'},
   {"<leader>ff", ':Telescope find_files<CR>',      desc = 'find'},
   {"<leader>fc", ':Telescope command_history<CR>', desc = 'commands'},


   -- Operations
   {"<leader>o", group = "Operations"},
   {"<leader>of", ":'<,'>!fold -w 100 -s<CR>",         desc = "fold"},
   {"<leader>oF", ":%!fold -w 100 -s<CR>",             desc = "fold buf"},
   {"<leader>bt", ':retab<CR>',                        desc = 'retab'},
   {"<leader>bT", ':retab!<CR>',                       desc = 'retab!'},
   -- {"<leader>oz", ":terminal ouch decompress %:p<CR>", desc = "decomp"},
   -- {"<leader>oZ", ":terminal ouch decompress %:p && rm %:p<CR>", desc = "decomp & rm"},


   -- Eval
   {"<leader>A",  ":Abort<CR>", desc = "abort all"},

   {"<leader>e", group = "Eval"},
   {"<leader>er", ":Run $NO_COLOR=1 irust<CR>",desc = "rust"},
   {"<leader>ej", ":Run clj -M -<CR>",         desc = "clojure"},
   {"<leader>ec", ":Run tcc -<CR>",            desc = "c"},
	{"<leader>ep", ":Run python3<CR>",          desc = "python"},
	{"<leader>eP", ":Run php<CR>",              desc = "php"},
	{"<leader>ed", ":Run deno<CR>",             desc = "deno"},
   {"<leader>eC", ":Run ceval c++ -x c++<CR>", desc = "cpp"},
   {"<leader>ez", ":Run ceval zig run<CR>",    desc = "zig"},
   {"<leader>eh", ":Run sh<CR>",               desc = "shell"},
   {"<leader>ee", ":Run eva -f 4<CR>",         desc = "eva"},
   {"<leader>eg", ":Run gpt<CR>",              desc = "gpt"},

   {"<leader>E", group = "Buf Eval"},
   {"<leader>Er", ":%Run $NO_COLOR=1 irust<CR>",desc = "rust"},
   {"<leader>Ej", ":%Run clj -M -<CR>",         desc = "clojure"},
   {"<leader>Ec", ":%Run tcc -<CR>",            desc = "c"},
	{"<leader>Ep", ":%Run python3<CR>",          desc = "python"},
	{"<leader>EP", ":%Run php<CR>",              desc = "php"},
	{"<leader>Ed", ":%Run deno<CR>",             desc = "deno"},
   {"<leader>EC", ":%Run ceval c++ -x c++<CR>", desc = "cpp"},
   {"<leader>Ez", ":%Run ceval zig run<CR>",    desc = "zig"},
   {"<leader>Eh", ":%Run sh<CR>",               desc = "shell"},
   {"<leader>Ee", ":%Run eva -f 4<CR>",         desc = "eva"},
   {"<leader>Eg", ":%Run gpt<CR>",              desc = "gpt"},


   -- Files
   {"<leader>a", group = "Applications"},
   {"<leader>ac", new_term("bacon clippy"),  desc = 'clippy'},
   {"<leader>ah", new_term("htop"),          desc = 'htop'},
   {"<leader>an", new_term("vimpc"),         desc = 'vimpc'},
   {"<leader>aw", new_term("wiki-tui"),      desc = 'wikitui'},
   {"<leader>af", new_term("fish"),          desc = 'fish'},
   {"<leader>ag", new_term("glow"),          desc = 'glow'},
   {"<leader>am", new_prompt_term("man"),    desc = 'man'},
   {"<leader>at", new_prompt_term("telnet"), desc = 'telnet'},


   -- Crates
   {"<leader>C", group = "Crates"},
   {"<leader>Cr", crates("reload"),                  desc = 'reload'},
   {"<leader>CC", crates("show_popup"),              desc = 'info'},
   {"<leader>Cv", crates("show_versions_popup"),     desc = 'version'},
   {"<leader>Cf", crates("show_features_popup"),     desc = 'features'},
   {"<leader>Cd", crates("show_dependencies_popup"), desc = 'dependencies'},
   {"<leader>CD", crates("open_documentation"),      desc = 'docs'},
   {"<leader>Cu", crates("upgrade_crate"),           desc = 'update'},
   {"<leader>CU", crates("upgrade_all_crates"),      desc = 'update all'},


	{"<leader>m", group = "Map"},
	{"<leader>mc", ":MapChars superscript<CR>", desc = "superscript"},
	{"<leader>ms", ":MapChars subscript<CR>",   desc = "subscript"},
})
