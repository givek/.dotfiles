-- colors

vim.o.background = "dark"
vim.o.termguicolors = true
vim.wo.winblend = 0
vim.go.wildoptions = "pum"
vim.go.pumblend = 5

require("catppuccin").setup({
    styles = {
        keywords = { "italic" },
    },
})

vim.cmd "colorscheme catppuccin"
