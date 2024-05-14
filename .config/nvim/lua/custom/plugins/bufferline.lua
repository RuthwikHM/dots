return {
  {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
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
        },
      }
      vim.keymap.set('n', ']b', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next [B]uffer' })
      vim.keymap.set('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous [B]uffer' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
