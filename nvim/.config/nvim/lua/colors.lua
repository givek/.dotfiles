-- colors

vim.o.background = "dark"
vim.o.termguicolors = true
vim.wo.winblend = 0
vim.go.wildoptions = "pum"
vim.go.pumblend = 5

-- catppuccin config
--
-- require("catppuccin").setup({
--     styles = {
--         keywords = { "italic" },
--     },
-- })


-- material config
--
-- vim.g.material_style = "deep ocean"


-- gruvbox config
--
-- vim.g.gruvbox_flat_style = "hard"


-- vim.cmd "colorscheme kanagawa"

require('palenightfall').setup()

-- require("neosolarized").setup({
--     comment_italics = true,
--     background_set = false,
-- })
