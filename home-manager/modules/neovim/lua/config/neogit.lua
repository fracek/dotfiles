local M = {}

function M.setup()
  require('neogit').setup {
    kind = 'tab',
    integrations = {
      diffview = true
    },
  }

  require('diffview').setup {
    use_icons = false,
  }
end

return M
