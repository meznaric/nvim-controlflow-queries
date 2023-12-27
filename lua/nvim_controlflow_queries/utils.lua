-- Reads the file, should probably replace with plenary
-- Ripped from some github issue
local function safe_read(filename, read_quantifier)
  local file, err = io.open(filename, "r")
  if not file then
    error(err)
  end
  local content = file:read(read_quantifier)
  io.close(file)
  return content
end

local function read_query_files(filenames)
  local contents = {}

  for _, filename in ipairs(filenames) do
    table.insert(contents, safe_read(filename, "*a"))
  end

  return table.concat(contents, "")
end

-- This removes a group from the query.
-- Note: It's fairly limited and expects a specific format in query
local function remove_highlight_group(group, query)
  -- Escape special characters in the group string
  local escapedGroup = group:gsub("[%-%.%+%[%]%(%)%$%^%%%?%*]", "%%%1")

  -- Define the start and end patterns for the range to be removed
  local startPattern = "%(%(identifier%) " .. escapedGroup
  local endPattern = "\n\n" -- Matches an empty line

  -- Find the start and end indices of the range to be removed
  local startIndex = string.find(query, startPattern)
  local endIndex = string.find(query, endPattern, startIndex) or #query
  -- If both start and end indices are found, remove the range
  if startIndex and endIndex then
    local prefix = string.sub(query, 1, startIndex - 1)
    local suffix = string.sub(query, endIndex + 1)
    query = prefix .. suffix
  end

  return query
end

local function read_query(language)
  return read_query_files(vim.treesitter.query.get_files(language, "highlights"))
end

local M = {}
M.read_query = read_query
M.remove_highlight_group = remove_highlight_group
return M
