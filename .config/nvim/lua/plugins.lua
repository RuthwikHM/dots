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
        config = function() require 'evilline' end,
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
    use 'hrsh7th/nvim-compe'
    -- Auto complete matching brackets,quotes.
    use 'jiangmiao/auto-pairs'
    -- Handle commenting
    use 'scrooloose/nerdcommenter'
    use 'tpope/vim-surround'
    -- List all tags in buffer
    use 'majutsushi/tagbar'
    -- Fuzzy file finder
    -- use 'junegunn/fzf.vim'
    -- Colorschemes
    use {'gruvbox-community/gruvbox', as='gruvbox'}
    use {'dracula/vim', as='dracula'}
end)
