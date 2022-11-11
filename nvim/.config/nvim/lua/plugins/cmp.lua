-- cmp config

vim.o.completeopt = "menuone,noinsert,noselect"
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}

local cmp = require 'cmp'

cmp.setup({
    -- snippet = {
    --   -- REQUIRED - you must specify a snippet engine
    --   expand = function(args)
    --     vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    --     -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --     -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    --   end,
    -- },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    }),

    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local menu
            local kind = require("lspkind").symbol_map[vim_item.kind] --.. " " .. vim_item.kind

            local alias = ({
                buffer = "[B]",
                path = "[P]",
                nvim_lsp = "[LSP]",
                luasnip = "[LS]",
                nvim_lua = "Lua",
                latex_symbols = "[TX]",
                nvim_lsp_signature_help = "[S]",
            })

            -- check if source of item exist. eg: Box (component), source: @chakra-ui/react
            if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
                menu = entry.completion_item.detail

            else -- if source does not exist then just use generic alias.
                menu = alias[entry.source.name] or entry.source.name
            end

            vim_item.menu = menu
            vim_item.kind = kind

            return vim_item
        end,
    },

    experimental = {
        native_menu = false,
        ghost_text = true,
    },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
