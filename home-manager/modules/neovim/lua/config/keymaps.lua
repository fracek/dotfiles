vim.g.mapleader = ','

vim.keymap.set('n', '<leader><space>', ':noh<CR>', { noremap = true })

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help' })

-- Neogit
local neogit = require('neogit')
vim.keymap.set('n', '<leader>gs', function() neogit.open({ kind = 'tab' }) end, { noremap = true, desc = 'Open neogit status' })
vim.keymap.set('n', '<leader>gc', function() neogit.open({ 'commit' }) end, { noremap = true, desc = 'Open neogit commit' })
