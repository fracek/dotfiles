local M = {}

function M.setup()
  vim.cmd [[packadd packer.nvim]]

  return require('packer').startup(function(use)
    -- Base plugins
    -- The best theme
    use { 'catppuccin/nvim', as = 'catppuccin' }

    -- status line
    use 'nvim-lualine/lualine.nvim'

    -- tab bar
    use 'nanozuki/tabby.nvim'

    -- Quickly jump around
    use {
      'nvim-telescope/telescope.nvim', 
      requires = 'nvim-lua/plenary.nvim'
    }

    use {
      'nvim-telescope/telescope-file-browser.nvim', 
      requires = {
        'nvim-telescope/telescope.nvim', 
        'nvim-lua/plenary.nvim'
      }
    }

    -- Almost as good as magit
    use {
      'TimUntersberger/neogit',
      requires = 'nvim-lua/plenary.nvim'
    }

    -- Works well with git mergetool
    use {
      'sindrets/diffview.nvim',
      requires = 'nvim-lua/plenary.nvim'
    }

    -- CBA remember all keys
    use 'folke/which-key.nvim'

    -- like ace-window
    use 'yorickpeterse/nvim-window'

    -- Better syntax highlight
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
    }

    -- use editorconfig to keep things consistent
    use 'gpanders/editorconfig.nvim'

    -- show undo tree
    use 'mbbill/undotree' 

    -- commenting
    use 'numToStr/Comment.nvim'

    -- Language support
    use 'neovim/nvim-lspconfig'
    -- use 'nvimdev/lspsaga.nvim'
    -- completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'

    -- Nix pilled
    use 'LnL7/vim-nix'

    -- Blazing fast
    use 'simrat39/rust-tools.nvim'
  end)
end

return M
