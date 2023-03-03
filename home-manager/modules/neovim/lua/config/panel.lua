local M = {}

function M.setup()
  require('nvim-tree').setup {
    git = {
      enable = false,
    },
    view = {
      side = 'right',
    },
    renderer = {
      icons = {
        show = {
	  file = false,
	  folder = false,
	  folder_arrow = false,
	  git = false,
	  modified = false,
	},
      },
    },
  }
end

return M
