vim.cmd([[ command! -nargs=1 RenameFile lua _rename__file(<q-args>) ]])

-- this doesnt work
function toggle_wrap()
  if vim.api.nvim_get_option("wrap") then
    vim.api.nvim_set_option("wrap", false)
  else
    vim.api.nvim_set_option("wrap", true)
  end
end

-- spell check
vim.opt_local.spelllang = 'en_us'
function toggle_spell()
   if vim.opt_local.spell:get() then
      vim.opt_local.spell = false
   else
      vim.opt_local.spell = true
   end
end


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

require('which-key').setup {
   triggers = {
      { "<auto>", mode = "nxsot" },
      -- { "<leader>", mode = "nv" },
   },
}
require('which-key').add({
   mode = {"n", "v"},
   
   {"<leader>c", desc = "comment"},
   {"<leader><leader>", ":noh<CR>", desc = "clear"},
   {"<leader>t", ":ToggleTerm<CR>", desc = "terminal"},
   {"<leader>W", ":lua toggle_wrap()<CR>", desc = "wrap"},
   {"<leader>w", "<C-w>w", desc = "next window"},


   -- Spell
   {"<leader>s", group = "Spell"},
   {"<leader>sS", ':lua toggle_spell()<CR>', desc = "toggle"},
   {"<leader>ss", '1z=', desc = "first"},
   {"<leader>sn", ']s', desc = "next"},
   {"<leader>sN", ']S', desc = "next bad"},
   {"<leader>sp", '[s', desc = "prev"},
   {"<leader>sP", '[S', desc = "prev bad"},
   {"<leader>sa", 'za', desc = "add"},
   {"<leader>sA", 'zw', desc = "add bad"},


   -- Git
   {"<leader>g", group = "Git"},
   {"<leader>gt", ":Gitsigns toggle_signs<CR>", desc = 'toggle signs'},
   {"<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", desc = 'line blame'},
   {"<leader>gB", ":Gitsigns blame<CR>", desc = 'blame'},
   {"<leader>ga", ":Gitsigns stage_hunk<CR>", desc = "stage hunk"},
   {"<leader>gu", ":Gitsigns undo_stage_hunk<CR>", desc = "unstage hunk"},
   {"<leader>gA", ":Gitsigns stage_buffer<CR>", desc = 'stage buffer'},
   {"<leader>gR", ":Gitsigns reset_buffer<CR>", desc = 'reset buffer'},
   {"<leader>gc", ":Git commit<CR>", desc = 'commit'},
   {"<leader>gC", ":Git commit --amend<CR>", desc = 'commit amend'},
   {"<leader>gs", ":Git restore --staged %<CR>", desc = 'restore staged'},
   {"<leader>gS", ":Git restore %<CR>", desc = 'restore'},
   {"<leader>gf", ":Git fetch<CR>", desc = 'fetch'},
   {"<leader>gp", ":Git push<CR>", desc = 'push'},
   {"<leader>gP", ":Git push --force-with-lease<CR>", desc = 'push force'},
   {"<leader>gL", ":Git pull<CR>", desc = 'pull'},
   {"<leader>g.", ":Git add .<CR>", desc = 'add all'},
   {"<leader>gU", ":Git reset HEAD~1<CR>", desc = 'undo'},
   {"<leader>gg", ":Git<CR>", desc = 'info'},
   {"<leader>gl", ":Git log --oneline --graph<CR>", desc = 'log'},


   -- Buffers
   {"<leader>b", group = "Buffers"},
   {"<leader>br", '<Cmd>Telescope buffers<CR>', desc = 'current'},
   {"<leader>bn", ':bn<CR>', desc = 'next'},
   {"<leader>bN", ':enew<CR>', desc = 'new'},
   {"<leader>bp", ':bp<CR>', desc = 'previous'},
   {"<leader>bd", ':bd<CR>', desc = 'delete'},
   {"<leader>bD", ':bd!<CR>', desc = 'force delete'},
   {"<leader>bw", ':wa!<CR>', desc = 'write all'}, 
   {"<leader>bf", ':lua format_buffer()<CR>', desc = 'format buffer'},


   -- Files
   {"<leader>f", group = "Files"},
   {"<leader>ft", ':Xplr %:p:h<CR>', desc = 'Xplr'},
   {"<leader>fr", ':Telescope oldfiles<CR>', desc = 'recent'},
   {"<leader>fw", ':Telescope live_grep<CR>', desc = 'grep'},
   {"<leader>ff", ':Telescope find_files<CR>', desc = 'find'},
   {"<leader>fR", ':RenameFile<CR>', desc = 'rename'},


   -- Files
   {"<leader>a", group = "Applications"},
   {"<leader>ac", ':lua _clippy_toggle()<CR>', desc = 'clippy'},
   {"<leader>ab", ':lua _broot_toggle()<CR>', desc = 'broot'},
   {"<leader>ah", ':lua _htop_toggle()<CR>', desc = 'htop'},
   {"<leader>an", ':lua _ncmpcpp_toggle()<CR>', desc = 'ncmpcpp'},
   {"<leader>aw", ':lua _wikitui_toggle()<CR>', desc = 'wikitui'},
   {"<leader>af", ':lua _fish_toggle()<CR>', desc = 'fish'},
   {"<leader>ag", ':lua _glow_toggle()<CR>', desc = 'glow'},
   {"<leader>am", ':ManPrompt<CR>', desc = 'man'},
   {"<leader>at", ':Telnet<CR>', desc = 'telnet'},


   -- Crates
   {"<leader>C", group = "Crates"},
   {"<leader>Cv", ':lua require("crates").show_versions_popup()<CR>', desc = 'version'},
   {"<leader>Cf", ':lua require("crates").show_features_popup()<CR>', desc = 'features'},
   {"<leader>Cd", ':lua require("crates").show_dependencies_popup()<CR>', desc = 'dependencies'},
   {"<leader>Cu", ':lua require("crates").upgrade_crate()<CR>', desc = 'update'},
   {"<leader>CU", ':lua require("crates").upgrade_all_crates()<CR>', desc = 'update all'},
})
