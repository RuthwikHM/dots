-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear search highlight on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Open Terminal
vim.keymap.set('n', '<leader>to', '<cmd>terminal<CR>', { desc = '[T]erminal [O]pen' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use ALT+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
local os = vim.loop.os_uname().sysname
if os == 'Linux' then
  vim.keymap.set('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
  vim.keymap.set('n', '<A-q>', '<C-w><C-q>', { desc = 'Close selected window' })
elseif os == 'Darwin' then
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
  vim.keymap.set('n', '<C-q>', '<C-w><C-q>', { desc = 'Close selected window' })
end

-- Switch split window placements
vim.keymap.set('n', '<leader>th', '<C-w>t<C-w>H', { desc = 'Change vertical to horizontal split' })
vim.keymap.set('n', '<leader>tk', '<C-w>t<C-w>K', { desc = 'Change horizontal to vertical split' })

-- Map jk to escape in insert mode
vim.keymap.set('i', 'jk', '<C-[>', { desc = 'Map jk to ESC' })

-- Using visual lines for movement
vim.keymap.set('n', 'j', 'gj', { desc = 'Move down one visual line' })
vim.keymap.set('n', 'k', 'gk', { desc = 'Move down up visual line' })
