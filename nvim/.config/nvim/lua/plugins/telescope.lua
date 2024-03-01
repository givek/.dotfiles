-- Telescope
--

local builtin = require("telescope.builtin")
local file_browser = require("telescope").load_extension "file_browser"

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>bf", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Telescope-file-browser
vim.keymap.set("n", "<leader>fb", file_browser.file_browser, {})
