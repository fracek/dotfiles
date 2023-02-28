local M = {}

function M.setup()
  require('config.keymaps').setup()
  require('config.ui').setup()
  require('config.telescope').setup()
  require('config.neogit').setup()
  require('config.lsp').setup()
  require('config.whichkey').setup()
end

return M
