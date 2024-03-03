require('nvim-treesitter.configs').setup({
    ensure_installed = {'bash','c','comment','css','diff','dockerfile','git_rebase','gitattributes','gitcommit','gitignore','go','gomod','gosum','gowork','graphql','html','java','javascript','json','json5','lua','proto','python','regex','sql','vim','yaml'},
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
    indent = { enable = true, disable = {}, }
})
