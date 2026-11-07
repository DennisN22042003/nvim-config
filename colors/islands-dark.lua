vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "islands-dark"

local c = {
  bg      = "#1e1f22",  -- placeholder: editor background
  fg      = "#bcbec4",  -- placeholder: default text
  comment = "#7a7e85",  -- placeholder
  keyword = "#cf8e6d",  -- placeholder
  string  = "#6aab73",  -- placeholder
  number  = "#2aacb8",  -- placeholder
  func    = "#56a8f5",  -- placeholder
  type    = "#c77dbb",  -- placeholder
  sel     = "#2e436e",  -- placeholder: selection
  line    = "#26282e",  -- placeholder: cursor line
}

local hl = function(g, o) vim.api.nvim_set_hl(0, g, o) end

hl("Normal",       { fg = c.fg, bg = c.bg })
hl("CursorLine",   { bg = c.line })
hl("Visual",       { bg = c.sel })
hl("Comment",      { fg = c.comment, italic = true })
hl("Keyword",      { fg = c.keyword })
hl("String",       { fg = c.string })
hl("Number",       { fg = c.number })
hl("Function",     { fg = c.func })
hl("Type",         { fg = c.type })
hl("Identifier",   { fg = c.fg })
hl("Statement",    { fg = c.keyword })

-- Treesitter groups link to the basics above
hl("@keyword",  { link = "Keyword" })
hl("@string",   { link = "String" })
hl("@number",   { link = "Number" })
hl("@function", { link = "Function" })
hl("@type",     { link = "Type" })
hl("@comment",  { link = "Comment" })
