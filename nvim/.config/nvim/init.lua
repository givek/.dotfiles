-- vim.o  = :set
-- vim.go = :setglobal
-- vim.bo = :setlocal (for buffer local options.)
-- vim.wo = :setlocal (for window local options.)

require "plugins"

require "cmp-config"

-- require('galaxyline')

vim.g.mapleader = " "

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.hlsearch = true

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true

-- nmap <C-n> :Lexplore<CR>
vim.api.nvim_set_keymap('n', '<C-n>', ':Lexplore<CR>', { noremap = true, silent = true })
vim.g.netrw_winsize = 16

vim.o.background = 'dark'
vim.o.termguicolors = true
vim.wo.winblend = 0
vim.go.wildoptions = 'pum'
vim.go.pumblend = 5

-- Gruvbox Flat 
vim.g.gruvbox_flat_style = "hard"
vim.cmd[[colorscheme gruvbox-flat]]




-- require('material').setup({
-- 
-- 	contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
-- 	borders = false, -- Enable borders between verticaly split windows
-- 
-- 	popup_menu = "dark", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )
-- 
-- 	italics = {
-- 		comments = true, -- Enable italic comments
-- 	},
-- 
-- 	contrast_windows = { -- Specify which windows get the contrasted (darker) background
-- 		"terminal", -- Darker terminal background
-- 		"packer", -- Darker packer background
-- 		"qf" -- Darker qf list background
-- 	},
-- 
-- 	disable = {
-- 		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
-- 		term_colors = false, -- Prevent the theme from setting terminal colors
-- 		eob_lines = false -- Hide the end-of-buffer lines
-- 	},
-- 
-- 	custom_highlights = {
--         Typedef= '#C37101'
--     } -- Overwrite highlights with your own
-- })
-- 
-- vim.g.material_style = "deep ocean"
-- vim.cmd 'colorscheme material'



-- vim.g.nightflyTransparent = 1
-- vim.g.nightflyCursorColor = 1
-- vim.g.nightflyNormalFloat = 1
-- vim.cmd[[colorscheme nightfly]]


-- NeoFormat
vim.api.nvim_set_keymap(
    'n', '<leader>f',
    ":Neoformat<CR>",
    { noremap = true, silent = true }
)


-- telescope
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "venv"
        }
    }
}

-- search local files
vim.api.nvim_set_keymap(
    'n', '<C-l><C-s>',
    ":lua require('telescope.builtin').find_files()<CR>",
    { noremap = true, silent = true }
)

-- open file browser
vim.api.nvim_set_keymap(
    'n', '<C-l><C-f>',
    ":lua require('telescope.builtin').file_browser()<CR>",
    { noremap = true, silent = true }
)

require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
      python,
      javascript,
      rust,
      cpp,
      c,
      c_sharp,
      tsx,
      json,
      html,
      css,
  },
}


-- lualine
-- require'lualine'.setup {
--   options = {
--     icons_enabled = true,
--     -- theme = 'nightfly',
--     theme = 'material-nvim',
--     component_separators = {'', ''},
--     section_separators = {'', ''},
--     disabled_filetypes = {}
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {}
-- }

-- TODO: Need to add those sweet sweet lsp workspace diagnostic counts

-- RELOAD "el"
require("el").reset_windows()

local builtin = require "el.builtin"
local extensions = require "el.extensions"
local sections = require "el.sections"
local subscribe = require "el.subscribe"
local lsp_statusline = require "el.plugins.lsp_status"
local helper = require "el.helper"

local has_lsp_extensions, ws_diagnostics = pcall(require, "lsp_extensions.workspace.diagnostic")

-- TODO: Spinning planet extension. Integrated w/ telescope.
-- ◐ ◓ ◑ ◒
-- 🌛︎🌝︎🌜︎🌚︎
-- Show telescope icon / emoji when you open it as well

local git_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
  local icon = extensions.file_icon(_, bufnr)
  if icon then
    return icon .. " "
  end

  return ""
end)

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
  local branch = extensions.git_branch(window, buffer)
  if branch then
    return " " .. extensions.git_icon() .. " " .. branch
  end
end)

local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
  return extensions.git_changes(window, buffer)
end)

local ws_diagnostic_counts = function(_, buffer)
  if not has_lsp_extensions then
    return ""
  end

  local messages = {}

  local error_count = ws_diagnostics.get_count(buffer.bufnr, "Error")

  local x = "⬤"
  if error_count == 0 then
    -- pass
  elseif error_count < 5 then
    table.insert(messages, string.format("%s#%s#%s%%*", "%", "StatuslineError" .. error_count, x))
  else
    table.insert(messages, string.format("%s#%s#%s%%*", "%", "StatuslineError5", x))
  end

  return table.concat(messages, "")
end

local show_current_func = function(window, buffer)
  if buffer.filetype == "lua" then
    return ""
  end

  return lsp_statusline.current_function(window, buffer)
end

local minimal_status_line = function(_, buffer)
  if string.find(buffer.name, "sourcegraph/sourcegraph") then
    return true
  end
end

local is_sourcegraph = function(_, buffer)
  if string.find(buffer.name, "sg://") then
    return true
  end
end

require("el").setup {
  generator = function(window, buffer)
    local is_minimal = minimal_status_line(window, buffer)
    local is_sourcegraph = is_sourcegraph(window, buffer)

    local mode = extensions.gen_mode { format_string = " %s " }
    if is_sourcegraph then
      return {
        { mode },
        { sections.split, required = true },
        { builtin.file },
        { sections.split, required = true },
        { builtin.filetype },
      }
    end

    local items = {
      { mode, required = true },
      { git_branch },
      { " " },
      { sections.split, required = true },
      { git_icon },
      { sections.maximum_width(builtin.responsive_file(140, 90), 0.40), required = true },
      { sections.collapse_builtin { { " " }, { builtin.modified_flag } } },
      { sections.split, required = true },
      { show_current_func },
      { lsp_statusline.server_progress },
      -- { ws_diagnostic_counts },
      { git_changes },
      { "[" },
      { builtin.line_with_width(3) },
      { ":" },
      { builtin.column_with_width(2) },
      { "]" },
      {
        sections.collapse_builtin {
          "[",
          builtin.help_list,
          builtin.readonly_list,
          "]",
        },
      },
      { builtin.filetype },
    }

    local add_item = function(result, item)
      if is_minimal and not item.required then
        return
      end

      table.insert(result, item)
    end

    local result = {}
    for _, item in ipairs(items) do
      add_item(result, item)
    end

    return result
  end,
}

--[[
let s:left_sep = ' ❯❯ '
let s:right_sep = ' ❮❮ '

        let s:seperator.filenameright = ''
        let s:seperator.filesizeright = ''
        let s:seperator.gitleft = ''
        let s:seperator.gitright = ''
        let s:seperator.lineinfoleft = ''
        let s:seperator.lineformatright = ''
        let s:seperator.EndSeperate = ' '
        let s:seperator.emptySeperate1 = ''
    elseif a:style == 'slant-cons'
        let s:seperator.homemoderight = ''
        let s:seperator.filenameright = ''
        let s:seperator.filesizeright = '' let s:seperator.gitleft = ''
        let s:seperator.gitright = ''
        let s:seperator.lineinfoleft = ''
        let s:seperator.lineformatright = ''
        let s:seperator.EndSeperate = ' '
        let s:seperator.emptySeperate1 = ''
    elseif a:style == 'slant-fade'
        let s:seperator.homemoderight = ''
        let s:seperator.filenameright = ''
        let s:seperator.filesizeright = ''
        let s:seperator.gitleft = ''
        let s:seperator.gitright = ''
        " let s:seperator.gitright = ''
        let s:seperator.lineinfoleft = ''
        let s:seperator.lineformatright = ''
        let s:seperator.EndSeperate = ' '
        let s:seperator.emptySeperate1 = ''
--]]

-- lsp colors
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

