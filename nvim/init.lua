local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'hrsh7th/nvim-cmp' -- Completion Plugin
    use 'hrsh7th/cmp-nvim-lsp' -- Completion from the LSP
    use 'hrsh7th/cmp-path' -- Completion from the filesystem
    use 'hrsh7th/cmp-buffer' -- Completion from the filesystem
    use 'hrsh7th/cmp-calc' -- Completion from math expressions
    use 'L3MON4D3/LuaSnip' -- Snippet Engine
    use 'saadparwaiz1/cmp_luasnip' -- Luasnip source for completion
    use 'hrsh7th/cmp-nvim-lua' -- Completion Source for lua & lua nvim api
    use 'onsails/lspkind.nvim'
    use 'morhetz/gruvbox'
    use 'lunarvim/darkplus.nvim'
    -- Commenter
    use 'numToStr/Comment.nvim'
    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
    use 'nvim-treesitter/playground'
end)

require('globals')
require('lsp')
require('colorscheme')
require('completion')
require('syntax')
