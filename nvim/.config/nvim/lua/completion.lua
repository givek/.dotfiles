vim.opt.completeopt = {"menu", "menuone", "noselect"}


local lsp = require 'lspconfig'
local cmp_lsp = require 'cmp_nvim_lsp'

lsp.vimls.setup {
  capabilities = 
    cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities) cmp = require "cmp"

cmp.setup ({
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    -- order of the sources, determies the prioty of completion options shown.
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'buffer', keyword_length = 5 }, -- keyword_length determies min number keys that should be typed before suggesting completions.
    }),

    experimental = {
      native_menu = false,
      ghost_text = true,
  },
})

vim.cmd [[packadd nvim-lspconfig]]

local lsp = require 'lspconfig'
local cmp_lsp = require 'cmp_nvim_lsp'

lsp.vimls.setup {
  capabilities = 
    cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
