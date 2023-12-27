# Foundation for better code highlighting in neovim

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/meznaric/nvim-plugin-template/lint-test.yml?branch=main&style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

Updates tree sitter queries that expose `@control_flow` highlight group. This allows you to highlight the most important parts (subjectively) of the code with a different color.

This goes best with `meznaric/my-clarity` color scheme that makes use of this new highlight group.

### Installing & Using

```
{
    "meznaric/nvim-controlflow-queries",
    opts = {
        -- That's the default and not needed, you can set to false and call `update_queries()` manually if you need
        set_queries_on_start = true
    },
},
```

And then you can set `@control_flow` variable to whatever you want.
```
vim.api.nvim_set_hl(0, "@control_flow", {fg = "#ff0000"})
```

### Missing a language?

Feel free to add a new language controlflow statements in `lua/nvim_controlflow_queries/languages`.

I recommend you have a look at typescript one and make something similar.

Please add a comment why each query modification is required.

### Why lua, not `highlights.scm`?

While adding a highlights.scm can get us pretty far, we realised it is not enough. For example, typescript extends javascript highlights that define `@type`. This clashes with typescript actual types  & variables, so we need to remove that specific highlight group from a query. Extending it is not enough.

If you have a better method, please let me know.
