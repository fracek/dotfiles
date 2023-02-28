local M = {}

function M.setup()
  require('neogit').setup {
    kind = 'tab',
    integrations = {
      diffview = true
    },
  }
end

return M
