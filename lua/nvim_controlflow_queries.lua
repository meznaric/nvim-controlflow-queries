---@class Config
---@field set_queries_on_start boolean
local config = {
  set_queries_on_start = true,
}

---@class MyModule
local M = {}

---@type Config
M.config = config

M.update_queries = function()
  require("nvim_controlflow_queries.languages.tsx").update_query()
  require("nvim_controlflow_queries.languages.lua").update_query()
end

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
  if M.config.set_queries_on_start then
    M.update_queries()
  end
end

return M
