# Foundation for better code highlighting in neovim

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/meznaric/nvim-controlflow-queries/lint-test.yml?branch=main&style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

Updates tree sitter queries that expose `@control_flow` highlight group. This allows you to highlight the most important parts (subjectively) of the code with a different color.

This goes best with [meznaric/my-clarity](https://github.com/meznaric/my-clarity) color scheme that makes use of this new highlight group.

To cover the entire range of control_flow options, my-clarity currently sets the following highlight groups to white and bold:
```
@control_flow    - Keywords exposed by this plugin.
@function.call   
@method.call     
@conditional
```

What is considered a `@control_flow` keyword?

For example here is the exhaustive list of control_flow keywords in typescript:
```
if
else

switch
case

return
yield

throw
try
catch
finally

for
while
do
continue
break

debugger
with
await
new
```

# Installing

If you are using a color scheme it's usually enough to just add it as a dependency. But you can install it independently if you want:

```
{
    "meznaric/nvim-controlflow-queries",
    opts = {
        -- That's the default and not needed, you can set to false and call `update_queries()` manually if you need
        set_queries_on_start = true
    },
},
```

# Using

You are recommended to use a colorscheme that makes use of `control_flow` highlight group. But if you want you can always set it manually like that:

```
vim.api.nvim_set_hl(0, "@control_flow", {fg = "#ffffff", gui = 'bold' })
vim.api.nvim_set_hl(0, "@function.call", {fg = "#ffffff", gui = 'bold' })
vim.api.nvim_set_hl(0, "@method.call", {fg = "#ffffff", gui = 'bold' })
vim.api.nvim_set_hl(0, "@conditional", {fg = "#ffffff", gui = 'bold' })
```

# Contributing

## Missing a language?

Feel free to add a new language control_flow statements in `lua/nvim_controlflow_queries/languages`.

I recommend you have a look at typescript one and make something similar.

Please add a comment why each query modification is required.

Please add example.filetype (eg `typescript.tsx` file so we can quickly check whether it's working or not.

## Why lua, not `highlights.scm`?

While adding a highlights.scm can get us pretty far, we realised it is not enough. For example, typescript extends javascript highlights that define `@type`. This clashes with typescript actual types  & variables, so we need to remove that specific highlight group from a query. Extending it is not enough.

If you have a better method, please let me know.

## Help needed:

 [ ] Figure out how it works with custom highlights that people added in `after/highlights.scm` and similar. Probably needs a different approach?
 [ ] Figure out how to initialise treesitter for testing purposes (so we can use treesitter APIs)
 [ ] Figure out how to map `@function.call`, `@method.call` and `@conditional` into @control_flow
