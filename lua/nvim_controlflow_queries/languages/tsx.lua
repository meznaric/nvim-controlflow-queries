local utils = require("nvim_controlflow_queries.utils")

-- this is a list of control keywords that get control flow highlights.
-- First line describes the orignal group they belong to

-- ; @conditional
-- "if"
-- "else"
-- "switch"
-- "case"

-- ; @keyword.return
-- "return"
-- "yield"

-- ; @exception
-- "throw"
-- "try"
-- "catch"
-- "finally"

-- ; @repeat (+ of)
-- "for"
-- "while"
-- "do"
-- "continue"

-- ; @keyword (+ 10 other)
-- "break"
-- "debugger"
-- "with"

-- ; @keyword.coroutine (+ async)
-- "await"

-- ; @keyword.operator (+ 4 other)
-- "new"

-- Main keyword list of control_flow keywords for typescript
local control_flow_query = [[
[
"if"
"else"
"switch"
"case"
"return"
"yield"
"throw"
"try"
"catch"
"finally"
"for"
"while"
"do"
"continue"
"break"
"debugger"
"with"
"await"
"new"
] @control_flow

; Redefine the @function.call so it has higher priority than @function.builtin
((call_expression
  function: (identifier) @function.call)
)
]]

-- Reads a query file, extends it
local function extend_query(language)
  local updated_query = (utils.read_query(language) .. control_flow_query)
  -- JavaScript defines `@type.builtin` which is not a type per se (in Typescript Terms)
  updated_query = utils.remove_highlight_group("@type.builtin", updated_query)
  -- This fixes `Sentry.init(...)` where Sentry is highlighted as a type instead of a variable
  updated_query = utils.remove_highlight_group("@type", updated_query)
  vim.treesitter.query.set(language, "highlights", updated_query)
end

local M = {}

M.update_query = function()
  extend_query("tsx")
  extend_query("typescript")
end

return M
