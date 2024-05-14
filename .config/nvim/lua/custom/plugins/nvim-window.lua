return {
  {
    'yorickpeterse/nvim-window',
    config = function()
      local nvim_window = require 'nvim-window'
      nvim_window.setup {}
      vim.keymap.set('n', '<leader>w', function()
        nvim_window.pick()
      end, { desc = 'Jump to [w]indow' })
    end,
  },
}
