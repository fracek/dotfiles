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
  -- show relative line numbers
  vim.opt.number = true
  vim.opt.relativenumber = true
  -- always enable mouse
  vim.opt.mouse = 'a'
  -- smartcase
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  -- cursor line
  vim.opt.cursorline = true
  -- persistent undofile
  vim.opt.undofile = true
  -- hide mode message
  vim.opt.showmode = false
  -- no wrapping
  vim.opt.wrap = false

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
