local M = {}

function M.setup()
  vim.g.mapleader = ' '

  local keymap = vim.keymap.set

  -- general
  keymap('n', '<leader>b', ':noh<CR>', { noremap = true, desc = 'Clear highlight' })
  keymap('n', '<leader>s', ':w<CR>', { noremap = true, desc = 'Save' })

  -- tabs
  keymap('n', '<leader>tn', '<cmd>tabnew<CR>', { noremap = true, silent = true, desc = 'Create new tab' })
  keymap('n', '<leader>tp', '<cmd>BufferPick<CR>', { noremap = true, silent = true, desc = 'Pick buffer' })
  keymap('n', '<leader>tx', '<cmd>BufferClose<CR>', { noremap = true, silent = true, desc = 'Close buffer' })
  keymap('n', '<leader>t.', '<cmd>BufferNext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
  keymap('n', '<leader>t,', '<cmd>BufferPrevious<CR>', { noremap = true, silent = true, desc = 'Prev buffer' })
  keymap('n', '<leader>t>', '<cmd>BufferMoveNext<CR>', { noremap = true, silent = true, desc = 'Move to next buffer' })
  keymap('n', '<leader>t<', '<cmd>BufferMovePrevious<CR>', { noremap = true, silent = true, desc = 'Move to prev buffer' })

  -- Undotree
  keymap('n', '<leader>u', vim.cmd.UndotreeToggle, { noremap = true, silent = true, desc = 'Toggle undo tree' })

  -- Telescope
  local telescope = require('telescope.builtin')
  keymap('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
  keymap('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope grep' })
  keymap('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
  keymap('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help' })

  -- Neogit
  local neogit = require('neogit')
  keymap('n', '<leader>ns', function() neogit.open({ kind = 'tab' }) end, { noremap = true, desc = 'Open neogit status' })
  keymap('n', '<leader>nc', function() neogit.open({ 'commit' }) end, { noremap = true, desc = 'Open neogit commit' })

  -- Nvim tree
  keymap('n', '<leader>pv', ':NvimTreeToggle<CR>', { noremap = true, desc = 'Toggle side panel' })

  -- Lspsaga
  keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { desc = 'LSP finder' })
  keymap({'n','v'}, '<leader>ca', '<cmd>Lspsaga code_action<CR>', { desc = 'LSP code action' })
  keymap('n', 'gr', '<cmd>Lspsaga rename<CR>', { desc = 'LSP rename' })
  keymap('n', 'gp', '<cmd>Lspsaga rename ++project<CR>', { desc = 'LSP rename in project' })
  keymap('n','gd', '<cmd>Lspsaga goto_definition<CR>', { desc = 'LSP goto definition' })
  keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = 'LSP prev diagnostic' })
  keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', { desc = 'LSP next diagnostic' })
  keymap('n', '[E', function()
    require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, { desc = 'LSP prev error' })
  keymap('n', ']E', function()
    require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, { desc = 'LSP next error' })
end

return M
