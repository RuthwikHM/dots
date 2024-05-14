return {
  {
    'nvim-tree/nvim-tree.lua',
    as = 'nvim-tree',
    config = function()
      -- Toggle NvimTree
      vim.keymap.set('n', '<leader>tf', '<cmd>NvimTreeToggle<cr>', { desc = '[T]oggle [F]ile tree' })
      local function onAttach(bufnr)
        local api = require 'nvim-tree.api'
        -- Setup default keybindings
        api.config.mappings.default_on_attach(bufnr)
        --
        -- Open file on create
        api.events.subscribe(api.events.Event.FileCreated, function(file)
          vim.cmd('edit ' .. file.fname)
        end)

        -- Use ? to trigger help
        vim.keymap.set('n', '?', api.tree.toggle_help, { desc = 'File tree help' })
      end

      local HEIGHT_RATIO = 0.8 -- You can change this
      local WIDTH_RATIO = 0.5 -- You can change this too

      -- Actual setup
      require('nvim-tree').setup {
        on_attach = onAttach,
        respect_buf_cwd = true,
        view = {
          centralize_selection = true,
          float = {
            enable = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * WIDTH_RATIO
              local window_h = screen_h * HEIGHT_RATIO
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
              return {
                border = 'rounded',
                relative = 'editor',
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
              }
            end,
          },
          width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
          end,
        },
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        diagnostics = {
          enable = true,
        },
        filters = {
          git_ignored = false,
        },
      }
    end,
  },
}
