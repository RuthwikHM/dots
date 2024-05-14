return {
  {
    'mbbill/undotree',
    config = function()
      -- Toggle UndoTree
      vim.keymap.set('n', '<leader>tu', '<cmd>UndotreeToggle<cr>', { desc = '[T]oggle [U]ndo tree' })
    end,
  },
}
