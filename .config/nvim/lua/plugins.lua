-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
--vim._update_package_paths()

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Statusline
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = function() require'evilline' end,
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'tpope/vim-fugitive'
    use 'tpope/vim-unimpaired'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- LSP
    use 'neovim/nvim-lspconfig'
    use {'RishabhRD/nvim-lsputils', requires = {'RishabhRD/popfix'}}
    use 'mfussenegger/nvim-jdtls'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    -- Provides function signature hints
    use {
        "ray-x/lsp_signature.nvim",
    }
    -- Auto complete matching brackets,quotes.
    use 'jiangmiao/auto-pairs'
    -- Handle commenting
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- Easy bindings for surrounding text with characters
    use {
        "blackCauldron7/surround.nvim",
        config = function()
            require"surround".setup {mappings_style = "surround"}
        end
    }
    -- List all tags in buffer
    use 'majutsushi/tagbar'
    -- Bufferline
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- Colorschemes
    use {'gruvbox-community/gruvbox', as='gruvbox'}
    use {'dracula/vim', as='dracula'}
end)
