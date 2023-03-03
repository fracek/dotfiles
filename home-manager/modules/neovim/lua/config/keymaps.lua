local M = {}

function M.setup()
  vim.g.mapleader = ' '

  local keymap = vim.keymap.set

  keymap('n', '<leader><space>', ':noh<CR>', { noremap = true, desc = 'Clear highlight' })
  keymap('n', '<leader>s', ':w<CR>', { noremap = true, desc = 'Save' })

  keymap('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true })
  keymap('n', '[e', vim.diagnostic.goto_prev, { noremap = true, silent = true })
  keymap('n', ']e', vim.diagnostic.goto_next, { noremap = true, silent = true })
  keymap('n', '<leader>q', vim.diagnostic.setloclist, { noremap = true, silent = true })

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
end

function M.on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  local keymap = vim.keymap.set

  keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
  keymap('n', 'K', vim.lsp.buf.hover, bufopts)
  keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  keymap('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  keymap('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  keymap('n', 'gr', vim.lsp.buf.references, bufopts)
  keymap('n', '<leader>fm', function() vim.lsp.buf.format { async = true } end, bufopts)
end

return M
