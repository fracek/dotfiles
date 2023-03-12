local M = {}

function M.setup()
  vim.cmd [[packadd packer.nvim]]

  return require('packer').startup(function(use)
    -- Base plugins
    -- The best theme
    use { 'rose-pine/neovim', as = 'rose-pine' }

    -- status line
    use 'nvim-lualine/lualine.nvim'

    -- tab bar
    use 'nanozuki/tabby.nvim'

    -- will replace me someday
    use 'github/copilot.vim'

    -- Quickly jump around
    use {
      'nvim-telescope/telescope.nvim', 
      requires = 'nvim-lua/plenary.nvim'
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

    -- Need side panel
    use 'nvim-tree/nvim-tree.lua'

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

    -- Language support
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
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
