vim.cmd [[packadd packer.nvim]]

return require('packer').startup(

    function(use)

        -- packer
        use 'wbthomason/packer.nvim'

        -- colorschemes
        use { "catppuccin/nvim", as = "catppuccin" }

        -- mason.nvim (manage LSP servers, DAP servers, linters, and formatters.)
        use { "williamboman/mason.nvim" }
        use "williamboman/mason-lspconfig.nvim"

        -- lsp-config
        use 'neovim/nvim-lspconfig'

        -- nvim-cmp
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/nvim-cmp'

        -- lsp-kind (Adds icons and styles to the completion menu.)
        use "onsails/lspkind.nvim"

    end

)
