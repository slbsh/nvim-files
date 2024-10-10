local highlights = {
   ErrorComment = {"!", "DEPRECATED"},
   QuestComment = {"?", "QUESTION", "SAFETY"},
   NoteComment  = {"#", "FOOTNOTE", "NOTE", "INFO"},
}

local function set_highlights()
   for group, keywords in pairs(highlights) do
      local pattern = string.format("\\v\\/\\/ *(\\%s)", table.concat(keywords, "|"))

      vim.api.nvim_command(string.format("syntax region %s start='%s' end='\\v(\\/\\/|$)' containedin=ALL contains=@NoSpell,Comment keepend extend", group, pattern))
      vim.api.nvim_command(string.format("syntax match %s '%s.*$'", group, pattern))
   end
end

vim.api.nvim_create_autocmd({"BufReadPost", "BufEnter"}, {callback = set_highlights})
