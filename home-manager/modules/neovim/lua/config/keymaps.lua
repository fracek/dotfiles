local M = {}

function M.setup()
  vim.g.mapleader = ','

  local keymap = vim.keymap.set

  -- general
  keymap('n', '<leader>b', ':noh<CR>', { noremap = true, desc = 'Clear highlight' })
  keymap('n', '<leader>s', ':w<CR>', { noremap = true, desc = 'Save' })

  -- tabs
  keymap('n', '<leader>tn', '<cmd>tabnew<CR>', { noremap = true, silent = true, desc = 'Create new tab' })
  keymap('n', '<leader>tc', '<cmd>tabclose<CR>', { noremap = true, silent = true, desc = 'Close tab' })
  keymap('n', '<leader>to', '<cmd>tabonly<CR>', { noremap = true, silent = true, desc = 'Only tab' })
  keymap('n', '<leader>t.', '<cmd>tabn<CR>', { noremap = true, silent = true, desc = 'Next tab' })
  keymap('n', '<leader>t,', '<cmd>tabp<CR>', { noremap = true, silent = true, desc = 'Prev tab' })
  keymap('n', '<leader>t>', '<cmd>+tabmove<CR>', { noremap = true, silent = true, desc = 'Move to next tab' })
  keymap('n', '<leader>t<', '<cmd>-tabmove<CR>', { noremap = true, silent = true, desc = 'Move to prev tab' })

  -- Undotree
  keymap('n', '<leader>u', vim.cmd.UndotreeToggle, { noremap = true, silent = true, desc = 'Toggle undo tree' })

  -- Telescope
  local telescope = require('telescope.builtin')
  keymap('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
  keymap('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope grep' })
  keymap('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help' })
  keymap('n', '<leader>ft', '<cmd>Telescope file_browser<CR>', { desc = 'Telescope file browser' })
  keymap('n', '<leader>fb', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = 'Telescope file browser (current file)' })

  -- Neogit
  local neogit = require('neogit')
  keymap('n', '<leader>ns', function() neogit.open({ kind = 'tab' }) end, { noremap = true, desc = 'Open neogit status' })
  keymap('n', '<leader>nc', function() neogit.open({ 'commit' }) end, { noremap = true, desc = 'Open neogit commit' })

  -- Nvim tree
  keymap('n', '<leader>pv', ':NvimTreeToggle<CR>', { noremap = true, desc = 'Toggle side panel' })

  -- LSP
  -- Goto X
  keymap('n','gd', vim.lsp.buf.definition, { desc = 'LSP goto definition' })
  keymap('n','gD', vim.lsp.buf.declaration, { desc = 'LSP goto declaration' })
  keymap('n','gi', vim.lsp.buf.implementation, { desc = 'LSP goto implementation' })
  keymap('n', 'gh', vim.lsp.buf.references, { desc = 'LSP finder' })
  -- Code
  keymap('n', 'K', vim.lsp.buf.hover, { desc = 'LSP hover' })
  keymap('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'LSP signature help' })
  keymap({'n','v'}, 'ca', vim.lsp.buf.code_action, { desc = 'LSP code action' })
  keymap('n', 'ce', vim.lsp.buf.rename, { desc = 'LSP rename' })
  keymap('n', '<leader>cu', function() 
    vim.lsp.buf.format { async = true }
  end, { desc = 'LSP format' })
  -- Diagnostic
  keymap('n', '[e', vim.diagnostic.goto_prev, { desc = 'LSP prev diagnostic' })
  keymap('n', ']e', vim.diagnostic.goto_next, { desc = 'LSP next diagnostic' })

  -- window picker
  keymap('n', '<leader>w', function() require('nvim-window').pick() end, { noremap = true, silent = true, desc = 'Jump window' })
end

return M
