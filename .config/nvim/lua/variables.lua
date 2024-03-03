local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options


--Autocommands
-- Automatically deletes all trailing whitespace and newlines at end of file on save.
cmd([[autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e]])

-- Vertically center document when entering insert mode
cmd([[autocmd InsertEnter * norm zz]])

-- Highlight yanks
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false, timeout = 200}'

opt.number = true
opt.relativenumber = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
-- opt.syntax = 'on'
opt.inccommand = 'split'
opt.hidden = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.list = true
opt.scrolloff = 3
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.wmh = 0
-- opt.foldmethod = 'expr'

--Gruvbox
g.gruvbox_contrast_dark = 'hard'
g.gruvbox_italic = 1

-- Tokyo Night
-- require('tokyonight').setup({
--     style = 'night'
-- })

--Colorscheme
cmd 'colorscheme gruvbox'
