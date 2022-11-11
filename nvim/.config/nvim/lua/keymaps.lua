-- keymaps

-- open netrw(file-explorer) on left: nmap <C-n> :Lexplore<CR>
vim.api.nvim_set_keymap("n", "<C-n>", ":Lexplore<CR>", { noremap = true, silent = true })

-- resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
