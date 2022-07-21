local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'hrsh7th/nvim-cmp' -- Completion Plugin
  use 'hrsh7th/cmp-nvim-lsp' -- Completion from the LSP
  use 'hrsh7th/cmp-path' -- Completion from the filesystem
  use 'hrsh7th/cmp-buffer' -- Completion from the filesystem
  use 'hrsh7th/cmp-calc' -- Completion from math expressions
  use 'morhetz/gruvbox'
  use 'lunarvim/darkplus.nvim'
  -- Commenter
  use 'scrooloose/nerdcommenter'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }
end)

require('globals')
require('lsp')
require('colorscheme')
require('completion')
require('syntax')