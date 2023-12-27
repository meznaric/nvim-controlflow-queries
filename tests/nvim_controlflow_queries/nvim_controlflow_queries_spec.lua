local plugin = require("nvim_controlflow_queries")

describe("setup", function()
  it("setup works", function()
    plugin.setup({
      set_queries_on_start = false,
    })
  end)
end)
