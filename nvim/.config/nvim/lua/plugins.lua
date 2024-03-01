vim.cmd [[packadd packer.nvim]]

return require("packer").startup(

    function(use)

        -- packer
        use "wbthomason/packer.nvim"

        -- colorschemes
        use 'JoosepAlviste/palenightfall.nvim'
        use { "catppuccin/nvim", as = "catppuccin" }
        use "marko-cerovac/material.nvim"
        use "eddyekofo94/gruvbox-flat.nvim"
        use {
            "https://gitlab.com/HiPhish/resolarized.nvim",
            as = "resolarized"
        }
        use {
            "svrana/neosolarized.nvim", requires = { { "tjdevries/colorbuddy.nvim" } }
        }
        use "folke/tokyonight.nvim"
        use "rebelot/kanagawa.nvim"

        -- mason.nvim (manage LSP servers, DAP servers, linters, and formatters.)
        use { "williamboman/mason.nvim" }
        use "williamboman/mason-lspconfig.nvim"

        -- lsp-config
        use "neovim/nvim-lspconfig"

        -- null-ls
        use "jose-elias-alvarez/null-ls.nvim"

        -- nvim-cmp
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/nvim-cmp"

        -- lsp-kind (Adds icons and styles to the completion menu.)
        use "onsails/lspkind.nvim"

        -- lua-snip
        use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })

        -- telescope
        use {
            "nvim-telescope/telescope.nvim", branch = "0.1.x",
            requires = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" }
        }
        use { "nvim-telescope/telescope-file-browser.nvim" }

        -- treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }
        use "nvim-treesitter/playground"

        -- comment
        use "numToStr/Comment.nvim"


        -- git-signs
        use {
            "lewis6991/gitsigns.nvim",
            -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
        }

        -- autopairs
        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }

        -- indent-blankline
        -- use "lukas-reineke/indent-blankline.nvim"
    end

)
