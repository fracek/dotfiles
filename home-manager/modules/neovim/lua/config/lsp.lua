local M = {}

function M.setup()

  require('rust-tools').setup {
    server = {
      on_attach = function(_, bufnr)
      end
    }
  }

  require('rust-tools').inlay_hints.enable()
end

return M
