local default = "tokyonight-night"
local file = vim.fn.stdpath("data") .. "/colorscheme.txt"

local function saved()
  local f = io.open(file, "r")
  if not f then return default end
  local name = f:read("*l")
  f:close()
  return (name and name ~= "") and name or default
end

-- Apply saved scheme, fall back gracefully if a plugin isn't installed yet
if not pcall(vim.cmd.colorscheme, saved()) then
  if not pcall(vim.cmd.colorscheme, default) then
    vim.cmd.colorscheme("habamax")
  end
end

-- :SaveColorscheme remembers whatever you're currently using
vim.api.nvim_create_user_command("SaveColorscheme", function()
  local f = io.open(file, "w")
  if f then
    f:write(vim.g.colors_name or default)
    f:close()
    vim.notify("Saved colorscheme: " .. (vim.g.colors_name or default))
  end
end, {})
