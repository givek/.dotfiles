vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function()
    -- packer
    use 'wbthomason/packer.nvim'

    -- colorschemes
    use 'bluz71/vim-nightfly-guicolors'
    use 'marko-cerovac/material.nvim'
    use 'eddyekofo94/gruvbox-flat.nvim'
    use 'shaunsingh/solarized.nvim'
    use 'ishan9299/modus-theme-vim'





    use 'dhruvasagar/vim-table-mode'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'tpope/vim-fugitive'

    -- treesitter
    use { 
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'folke/lsp-colors.nvim'


    use {
        'tjdevries/express_line.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

  use 'kyazdani42/nvim-web-devicons'

    -- nvim-lsp
    use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    }

    -- completion
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-buffer" }, -- buffer words completion
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" }, -- file paht completion
        { "hrsh7th/cmp-nvim-lua" },
        { "ray-x/cmp-treesitter" },
        { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'onsails/lspkind-nvim' },
      }}

      -- tabline
      use 'mkitt/tabline.vim'

      -- formatting
      use 'sbdchd/neoformat'
      use 'mhartington/formatter.nvim'

  end
)
