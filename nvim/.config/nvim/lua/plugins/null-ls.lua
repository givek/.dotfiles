local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.completion.spell,

        -- python
        null_ls.builtins.formatting.black,

        -- js, ts, jsx, tsx
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,

        -- go
        null_ls.builtins.formatting.gofmt,
    },
})
