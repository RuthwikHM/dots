return {
  {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      local groups = require 'bufferline.groups'
      require('bufferline').setup {
        options = {
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Explorer',
              text_align = 'center',
              highlight = 'Directory',
              separator = true, -- use a "true" to enable the default, or set your own character
            },
          },
          groups = {
            options = {
              toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
            },
            items = {
              {
                name = 'Terminals',
                auto_close = true,
                matcher = function(buf)
                  return buf.name:match 'zsh'
                end,
              },
              groups.builtin.ungrouped,
            },
          },
        },
      }
      vim.keymap.set('n', ']b', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next [B]uffer' })
      vim.keymap.set('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous [B]uffer' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
