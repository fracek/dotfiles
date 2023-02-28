vim.g.mapleader = ','

local keymap = vim.keymap.set

keymap('n', '<leader><space>', ':noh<CR>', { noremap = true })

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

-- Lsp Saga
keymap('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', { desc = 'Go to definition' })
keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { desc = 'Symbol finder' })
keymap('n', 'ca', '<cmd>Lspsaga code_action<CR>', { desc = 'Code action' })
keymap('n', 'gr', '<cmd>Lspsaga rename<CR>', { desc = 'Rename' })
keymap('n', 'gf', '<cmd>Lspsaga show_cursor_diagnostic<CR>', { desc = 'Show diagnostics' })
keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = 'Go to prev diagnostic' })
keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', { desc = 'Go to next diagnostic' })
