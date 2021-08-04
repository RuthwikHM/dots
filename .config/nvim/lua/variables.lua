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

-- cmd ':TSEnableAll highlight'
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

--Colorscheme
cmd 'colorscheme dracula'
--Gruvbox
g.gruvbox_contrast_dark = 'hard'
g.gruvbox_italic = 1

-- Nerd Commenter stuff
-- Add spaces after comment delimiters by default
g.NERDSpaceDelims = 1
g.NERDDefaultAlign="left"
-- Use compact syntax for prettified multi-line comments
g.NERDCompactSexyComs = 1
-- Align line-wise comment delimiters flush left instead of following code indentation
g.NERDDefaultAlign = 'left'
-- Set a language to use its alternate delimiters by default
g.NERDAltDelims_java = 1
-- Add your own custom formats or override the defaults
cmd([[
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
]])
-- Allow commenting and inverting empty lines (useful when commenting a region)
g.NERDCommentEmptyLines = 1
-- Enable trimming of trailing whitespace when uncommenting
g.NERDTrimTrailingWhitespace = 1
-- Enable NERDCommenterToggle to check all selected lines is commented or not
g.NERDToggleCheckAllLines = 1
