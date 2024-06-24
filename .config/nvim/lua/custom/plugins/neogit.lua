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

            vim.api.nvim_create_autocmd('user', {
        pattern = 'neogitbranchcheckout',
        desc = 'checkout branch and change session to an existing one if exists else create a new one',
        group = vim.api.nvim_create_augroup('autosessions-branch-checkout', { clear = true }),
        callback = function(opts)
          local autosessions = require 'auto-session'
          local branch_name = opts.data.branch_name
          local session_file_name = string.format(vim.fn.getcwd() .. '_%s', branch_name)

          neogit.close()
          autosessions.savesession('', false)

          print 'deleting all buffers'
          local buffers = vim.api.nvim_list_bufs()
          for _, buffer in pairs(buffers) do
            if vim.api.nvim_buf_is_loaded(buffer) then
              if vim.fn.getbufvar(buffer, '&buftype') == 'terminal' then
                vim.cmd(string.format('bd! %d', buffer))
              else
                vim.cmd(string.format('silent! confirm bd %d', buffer))
              end
              print('deleted buffer', buffer)
            end
          end

          local session_files = autosessions.get_session_files()
          local session_file = nil
          for _, v in pairs(session_files) do
            if string.find(v.display_name, session_file_name) ~= nil then
              session_file = v.display_name
              break
            end
          end

          if session_file == nil then
            print('could not load session. a session file is likely missing for this cwd. ' .. vim.fn.getcwd())
          else
            autosessions.restoresessionfromfile(session_file)
            print('session restored successfully for ' .. branch_name)
          end
        end,
      })

    end,
  },
}
