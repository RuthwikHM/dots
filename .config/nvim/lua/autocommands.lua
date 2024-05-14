-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('InsertEnter', {
  desc = 'Vertically center document when entering insert mode',
  group = vim.api.nvim_create_augroup('custom-center-on-insert', { clear = true }),
  callback = function()
    vim.cmd 'norm zz'
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Delete trailing spaces and newlines at the end of file on save',
  group = vim.api.nvim_create_augroup('custom-delete-trailing-spaces', { clear = true }),
  callback = function()
    vim.cmd '%s/\\s\\+$//e'
    vim.cmd '%s/\n\\+\\%$//e'
  end,
})
