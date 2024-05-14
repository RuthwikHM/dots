-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '`' },
      },
      current_line_blame = true,
      on_attach = function(bufnr)
        local gs = require 'gitsigns'
        vim.keymap.set('n', ']h', gs.next_hunk, { desc = 'Next [H]unk' })
        vim.keymap.set('n', '[h', gs.prev_hunk, { desc = 'Previous [H]unk' })
        vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { desc = '[G]it Hunk [S]tage' })
        vim.keymap.set('n', '<leader>gr', gs.reset_hunk, { desc = '[G]it Hunk [R]eset' })
        vim.keymap.set('v', '<leader>gs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[H]unk [S]tage' })
        vim.keymap.set('v', '<leader>gr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[Hunk] [R]eset' })
        vim.keymap.set('n', '<leader>gS', gs.stage_buffer, { desc = '[G]it Hunk [S]tage Buffer' })
        vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk, { desc = '[G]it Hunk [U]ndo Stage' })
        vim.keymap.set('n', '<leader>gR', gs.reset_buffer, { desc = '[G]it Hunk [R]eset Buffer' })
        vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { desc = '[G]it Hunk [Preview]' })
        vim.keymap.set('n', '<leader>gd', gs.diffthis, { desc = '[G]it Hunk [D]iff' })
        vim.keymap.set('n', '<leader>gD', function()
          local relativeTo = vim.fn.input 'Relative to: ' or '~'
          gs.diffthis(relativeTo)
        end, { desc = '[G]it Hunk [D]iff Relative' })
        vim.keymap.set('n', '<leader>gtd', gs.toggle_deleted, { desc = '[G]it Hunk [T]oggle [D]eleted' })
        vim.keymap.set({ 'o', 'x' }, 'gih', ':<C-U>Gitsigns select_hunk<CR>', { desc = '[G]it Select [I]n [H]unk' })
      end,
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
