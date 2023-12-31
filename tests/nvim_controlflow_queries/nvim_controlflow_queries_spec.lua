local plugin = require("nvim_controlflow_queries")

describe("setup", function()
  it("setup works", function()
    plugin.setup({
      -- Setting it to false will not update queries immediately (treesitter is not initialised)
      -- Gotta figure out how to write these tests first :shrug:
      set_queries_on_start = false,
    })
  end)
end)
