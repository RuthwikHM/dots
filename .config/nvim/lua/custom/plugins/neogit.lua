return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
    },
    commit = 'd0fb4d8d13cba277ccfa4ad1d44e707659e453cf',
    config = function()
      local neogit = require 'neogit'
      local open_neogit = function()
        neogit.open { kind = 'auto' }
      end
      require('neogit').setup {}
      vim.keymap.set('n', '<leader>go', open_neogit, { desc = '[G]it [Open]' })
      vim.keymap.set('n', '<leader>do', '<Cmd> DiffviewOpen<CR>', { desc = '[D]iffview [O]pen' })
      vim.keymap.set('n', '<leader>dc', '<Cmd> DiffviewClose<CR>', { desc = '[D]iffview [C]lose' })
    end,
  },
}
