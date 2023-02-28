local M = {}

function M.setup()
  require('rust-tools').setup {
    server = {
      on_attach = require('config.keymaps').on_attach
    }
  }

  require('rust-tools').inlay_hints.enable()
end

return M
