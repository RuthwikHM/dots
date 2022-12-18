require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',
    highlight = { enable = true , disable = {}},
    -- incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --         init_selection = "<leader>gnn",
    --         node_incremental = "<leader>gn",
    --         scope_incremental = "<leader>grc",
    --         node_decremental = "<leader>grm",
    --     },
    -- },
    indent = { enable = true, disable = {},}
})
