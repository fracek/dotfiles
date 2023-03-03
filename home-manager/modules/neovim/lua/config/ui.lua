local M = {}

function M.setup()
  require('catppuccin').setup {
    integrations = {
      nvimtree = true,
      telescope = true,
      neogit = true,
      which_key = true,
    },
  }
  vim.cmd.colorscheme 'catppuccin-mocha'

  -- set termguicolors to enable highlight groups
  vim.opt.termguicolors = true

  -- transparent background
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

  -- status line
  require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = 'catppuccin',
      disabled_filetypes = {},
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
    },
  }

  -- tab bar
  require('bufferline').setup {
    auto_hide = true,
    closable = false,
    icons = false,
  }
end

return M
